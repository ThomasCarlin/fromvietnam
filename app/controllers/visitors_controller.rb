class VisitorsController < ApplicationController
	 respond_to :html

	def index
        @filterrific = initialize_filterrific(
          Person,
          params[:filterrific],
          select_options: {
            sorted_by: Person.options_for_sorted_by,
            state: Person.options_for_states,
            race: Person.options_for_race
          }
        ) or return
        @cases= @filterrific.find.page(params[:page])
#    	if params[:race] != nil
#   		@cases = @cases.where("race = ? ", params[:race])
#    	end
#    	if params[:state] != nil && params[:state].to_s != 'ST'
#    		@cases = @cases.where("state = ?", params[:state])
#    	end
        # Respond to html for initial page load and to js for AJAX filter updates.
        respond_to do |format|
          format.html
          format.js
        end
	end

    def show
    end



	def filter
		@cases = Person.where("race = ? ", params[:race])
		redirect_to visitors_path, race: params[:race]
	end
end
