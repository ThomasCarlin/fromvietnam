class VisitorsController < ApplicationController
	 respond_to :html

	def index
    	@cases = Case.all
    	if params[:race] != nil
    		@cases = @cases.where("race = ? ", params[:race])
    	end
    	if params[:state] != nil && params[:state].to_s != 'ST'
    		@cases = @cases.where("state = ?", params[:state])
    	end
    	respond_with(@cases)
	end



	def filter
		@cases = Case.where("race = ? ", params[:race])
		redirect_to visitors_path, race: params[:race]
	end
end
