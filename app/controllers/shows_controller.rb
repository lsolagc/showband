class ShowsController < InheritedResources::Base

  private

    def show_params
      params.require(:show).permit(:venue, :venue_address, :start_time)
    end

end
