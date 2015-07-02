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
    @veteran.email  = params[:email]
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
