class RequestsController < InheritedResources::Base
  before_action :set_current_show
  before_action :set_request, only: :destroy

  def create
    @request = Request.new(music: Music.find(request_params['request']['music_id']), show: @show, requester: request_params['request']['requester'])
    if @request.save
      session[:requests] ||= []
      session[:requests] << @request.to_session_store
      respond_to do |format|
        format.html  { redirect_to root_path, flash: { notice: 'Thank you for your song request! We will do our best to fulfill your request.' } }
        format.json  { render :json => @request }
      end
    else
      respond_to do |format|
        format.html  { redirect_to new_request_path, flash: { alert: 'Sorry! We could not save your request due to an error. Please, try again.' } }
        format.json  { render :json => @request }
      end
    end
  end

  def destroy
    session['requests'].reject!{ |r| r["id"] == @request.id }
    redirect_to root_path
  end
  private

    def request_params
      params.permit(:id, request: [:requester, :music_id])
    end

    def set_current_show
      @show = Show.where('start_time > ?', DateTime.current).order(:start_time).first
    end

    def set_request
      @request = Request.find(request_params['id'])
    end

end
