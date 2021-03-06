class VeteransController < ApplicationController
  before_action :set_veteran, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @veterans = Veteran.all
    respond_with(@veterans)
  end

  def show
    respond_with(@veteran)
    
  end

  def new
    @veteran = Veteran.new
    respond_with(@veteran)
  end

  def edit
  end

  def create
    @veteran = Veteran.new(veteran_params)
    if user_signed_in?
      @veteran.email = current_user.email
    end
    @veteran.email  = params[:email]
    @veteran.race = params[:race]
    x = params[:veteran]
    @veteran.DOB= x["DOB(1i)"]
    @veteran.state = params[:state]
    @veteran.race = params[:race]
    @veteran.branch = params[:branch]
    flash[:notice] = 'Veteran was successfully created.' if @veteran.save
    respond_with(@veteran)
  end

  def update
    flash[:notice] = 'Veteran was successfully updated.' if @veteran.update(veteran_params)
    respond_with(@veteran)
  end

  def destroy
    @veteran.destroy
    respond_with(@veteran)
  end

  private
    def set_veteran
      @veteran = Veteran.find(params[:id])
    end

    def veteran_params
      params.require(:veteran).permit(:name,:DOB,:birthplace,:race,:mothername,:place,:motherdetails,:fathername,:state,:position,:time,:occupation,:fatherdetails,:images,:email, :placeofduty,:branch, :story)
    end
end
