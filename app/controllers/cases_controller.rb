class CasesController < ApplicationController
  before_action :set_case, only: [:show, :edit, :update, :destroy, :request_info]

  respond_to :html

  def index
    @cases = Case.all
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
    @case = Case.new
    respond_with(@case)
  end

  def edit
    @case = Case.find(params[:id])
    if @case.DOB != nil
      @DOB = @case.DOB.to_i
    else
      @DOB = Date.today
    end
  end

  def create
    @case = Case.new(case_params)
    if user_signed_in?
      @case.email = current_user.email
    end

    time = Time.new
    if params[:case][:image_id] != nil
      Cloudinary::Uploader.upload(params[:case][:image_id], :public_id => time.to_s, :width => 300, :height => 200, :crop=> :limit)
      @case.images = time.to_s
    end
    if params[:date][:timeOfDutyStart] != nil
      @case.startyear = params[:date][:timeOfDutyStart].to_s
    end
    if params[:date][:timeOfDutyEnd] != nil
      @case.endyear = params[:date][:timeOfDutyEnd].to_s
    end
    if params[:case][:country].to_s != ""
      country = ISO3166::Country[params[:case][:country] ]
      @case.country=  country.name
    end

    if params[:date][:DOB] != nil
      @case.DOB = params[:date][:DOB].to_s
    end


    if @case.save
      flash[:notice] = 'Case was successfully created.'
      #AuthenticationMailer.authenticate_email(@case).deliver_now
    end

    respond_with(@case)
  end

  def update
    if user_signed_in?
      @case.email = current_user.email
    end

    time = Time.new
    if params[:case][:image_id] != nil
      Cloudinary::Uploader.upload(params[:case][:image_id], :public_id => time.to_s, :width => 300, :height => 200, :crop=> :limit)
      @case.images = time.to_s
    end
    if params[:date][:timeOfDutyStart] != nil
      @case.startyear = params[:date][:timeOfDutyStart].to_s
    end
    if params[:date][:timeOfDutyEnd] != nil
      @case.endyear = params[:date][:timeOfDutyEnd].to_s
    end
    if params[:case][:country].to_s != ""
      country = ISO3166::Country[params[:case][:country] ]
      @case.country=  country.name
    end

    if params[:date][:DOB] != nil
      @case.DOB = params[:date][:DOB].to_s
    end
    flash[:notice] = 'Case wasFUCK successfully updated.' if @case.update(case_params)
    respond_with(@case)
  end

  def destroy
    @case.destroy
    respond_with(@case)
  end

  def request_info
    AuthenticationMailer.request_info_email(@case, params[:email], params[:message]).deliver_now
    respond_with(@case)
  end


  private
    def set_case
      @case = Case.find(params[:id])
    end

    def case_params
      params.require(:case).permit(:name,:DOB,:birthplace,:race,:mothername,:place,:motherdetails,:fathername,:state,:position,:time,:occupation,:fatherdetails,:email, :placeofduty,:branch, :story, :isveteran,:country)
    end
end
