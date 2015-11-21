class EventsController < ApplicationController
	before_action :set_event, only: [:show, :edit, :update, :destroy]

	def index

		case params[:events]
		    when 'today'
		    	@events = Event.today
		    	@partial_name = 'today'
		    when 'upcoming'
		      	@events = Event.where('start_date >= ?', Time.now).order('start_date asc').limit(3)
		      	@partial_name = 'upcoming'
		    when 'past'
		 		@events = Event.where('start_date < ?', DateTime.now-1).order('start_date asc').limit(3)
		 		@partial_name = 'past'
	 	    when 'bymonth'
	  	    	@events = Event.all.order('start_date').group_by { |t| t.start_date.beginning_of_month }
	  	    	@partial_name = 'bymonth'
	  	    else
	  	    	@events = Event.all.order('start_date asc')
	  	    	@partial_name = 'all'
	  	end

		#Search
		if params[:search].present?
      		@events = @events.where('lower(name) like :search', search: '%#{params[:search].downcase}%')
      		#@events = @events.where("lower(name) like :search or lower(event_type) like :search", search: "%#{params[:search].downcase}%")
      	end

	end

	def show
	end

	def new
		@event = Event.new
	end

	def edit
	end

	def create
	  	@event = Event.new(event_params)

	    respond_to do |format|
	      if @event.save
	        format.html { redirect_to @event, notice: 'Event was successfully created.' }
	        format.json { render :show, status: :created, location: @event }
	        format.ics { render text: @event.to_ics, mime_type: Mime::Type["text/calendar"] }
	      else
	        format.html { render :new }
	        format.json { render json: @event.errors, status: :unprocessable_entity }
	      end
	    end		
	end

	def update
		respond_to do |format|
			if @event.update(event_params)
				format.html { redirect_to @event, notice: 'Event was updated.' }
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
			format.html { rediretct_to event_url, notice: 'Event was deleted.' }
			format.json { head :no_content }
		end
	end


private

	def set_event
      @event = Event.find(params[:id])
    end

    def event_params
    	params.require(:event).permit(:name, :start_date, :end_date, :website)
    end
end
