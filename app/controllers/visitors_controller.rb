class VisitorsController < ApplicationController
	 respond_to :html

	def index
    	@cases = Case.all
    	if params[:race] != nil
    		@cases = @cases.where("race = ? ", params[:race])
    	end
    	respond_with(@cases)
    	@race = params[:race]
	end



	def filter
		@cases = Case.where("race = ? ", params[:race])
		redirect_to visitors_path, race: params[:race]
	end
end
