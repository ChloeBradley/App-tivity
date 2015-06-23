class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index

    if params["search"].present?
      @conn = Faraday.new(url: "http://api.eventful.com")
      search_term = params["search"]
      location = params["location"]

      response = @conn.get do |req|
        req.url "/rest/events/search?location=#{location}&keywords=#{search_term}&app_key=ZFL4M9WfctW6Sv8G"
        req.headers['Content-Type'] = 'application/json'
    end

      data = Hash.from_xml(response.body).to_json

      # @ events is an array of event hashes
      @events = JSON.parse(data).first[1]["events"]["event"]
    else
      @events = []
    end

    @hash = Gmaps4rails.build_markers(@events) do |event, marker|
      marker.lat event["latitude"]
      marker.lng event["longitude"]
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end
end
