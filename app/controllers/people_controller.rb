class PeopleController < ApplicationController
  before_action :set_case, only: [:show, :edit, :update, :destroy, :request_info]

  respond_to :html

  def index
    @cases = Person.all
    respond_with(@cases)
  end

  def show
    if @case.viewcount != nil
      @case.viewcount += 1
    else
      @case.viewcount = 1
    end
    @case.save
    respond_with(@case)
    
  end

  def new
    @case = Person.new
    respond_with(@case)
  end

  def edit
    @case = Person.find(params[:id])
    if @case.dob != nil
      @DOB = @case.dob.to_i
    else
      @DOB = Date.today
    end
  end

  def create
    @case = Person.new(case_params)
    if user_signed_in?
      @case.email = current_user.email
    end

    time = Time.new
    if params[:person][:image_id] != nil
      Cloudinary::Uploader.upload(params[:person][:image_id], :public_id => time.to_s)
      @case.images = time.to_s
    end
    if params[:date][:timeOfDutyStart] != nil
      @case.startyear = params[:date][:timeOfDutyStart].to_s
    end
    if params[:date][:timeOfDutyEnd] != nil
      @case.endyear = params[:date][:timeOfDutyEnd].to_s
    end
    if params[:person][:country].to_s != ""
      country = ISO3166::Country[params[:person][:country] ]
      @case.country=  country.name
    end

    if params[:date][:DOB] != nil
      @case.dob = params[:date][:DOB].to_s
    end


    if @case.save
      flash[:notice] = 'Case was successfully created.'
      AuthenticationMailer.authenticate_email(@case).deliver_now
    end

    respond_with(@case)
  end

  def update
    if user_signed_in?
      @case.email = current_user.email
    end

    time = Time.new
    if params[:person][:image_id] != nil
      Cloudinary::Uploader.upload(params[:person][:image_id], :public_id => time.to_s, :width => 300, :height => 200, :crop=> :limit)
      @case.images = time.to_s
    end
    if params[:date][:timeOfDutyStart] != nil
      @case.startyear = params[:date][:timeOfDutyStart].to_s
    end
    if params[:date][:timeOfDutyEnd] != nil
      @case.endyear = params[:date][:timeOfDutyEnd].to_s
    end
    if params[:person][:country].to_s != ""
      country = ISO3166::Country[params[:person][:country] ]
      @case.country=  country.name
    end

    if params[:date][:DOB] != nil
      @case.dob = params[:date][:DOB].to_s
    end
    flash[:notice] = 'Case was successfully updated.' if @case.update(case_params)
    respond_with(@case)
  end

  def destroy
    @case.destroy
    flash[:notice] = 'Case was deleted.' 
    redirect_to root_path
  end

  def request_info
    AuthenticationMailer.request_info_email(@case, params[:email], params[:message]).deliver_now
    respond_with(@case)
  end


  private
    def set_case
      @case = Person.find(params[:id])
    end

    def case_params
      params.require(:person).permit(:name,:DOB,:birthplace,:race,:mothername,:place,:motherdetails,:fathername,:state,:position,:time,:occupation,:fatherdetails,:email, :placeofduty,:branch, :story, :isveteran,:country)
    end
end
