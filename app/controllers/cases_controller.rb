class CasesController < ApplicationController
  before_action :set_case, only: [:show, :edit, :update, :destroy]

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
  end

  def create
    @case = Case.new(case_params)
    if user_signed_in?
      @case.email = current_user.email
    end

    time = Time.new
    @case.placeofduty = params[:case][:image_id]
    Cloudinary::Uploader.upload(params[:case][:image_id], :public_id => time.to_s)
    @case.images = time.to_s

    x = params[:case]
    @case.DOB= x["DOB(1i)"]


    if @case.save
      flash[:notice] = 'Case was successfully created.'
      AuthenticationMailer.authenticate_email(@case).deliver_now
    end

    respond_with(@case)
  end

  def update
    flash[:notice] = 'Case was successfully updated.' if @case.update(case_params)
    respond_with(@case)
  end

  def destroy
    @case.destroy
    respond_with(@case)
  end

  def request_info
    AuthenticationMailer.request_info_email(@case, params[:email], params[:message]).deliver_now
    redirect_to case_path(params[:id])
  end

  private
    def set_case
      @case = Case.find(params[:id])
    end

    def case_params
      params.require(:case).permit(:name,:DOB,:birthplace,:race,:mothername,:place,:motherdetails,:fathername,:state,:position,:time,:occupation,:fatherdetails,:email, :placeofduty,:branch, :story)
    end
end
