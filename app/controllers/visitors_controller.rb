class VisitorsController < ApplicationController
	 respond_to :html

	def index
    	@cases = Case.all
    	respond_with(@cases)
	end
end
