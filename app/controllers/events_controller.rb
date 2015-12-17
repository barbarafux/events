class EventsController < ApplicationController

	before_action :set_event, only: [:show, :edit, :update, :destroy]

	def index

 		if params[:search]
   			@events = Event.search(params[:search])
  			@partial_name = 'search'
  		else	
			case params[:events]
			    when 'today'
			    	@events = Event.today
			    	@partial_name = 'today'
			    when 'past'
			 		@events = policy_scope(Event)
			 		@events = Event.where('start_date < ?', DateTime.now-1).order('start_date desc').page(params[:page]).per(4)
			 		@partial_name = 'past'
		  	    else
		  	    	@events = policy_scope(Event)
		  	    	#@events = Event.where('start_date > ?', DateTime.now).order('start_date asc').group_by { |t| t.start_date.beginning_of_month}
		  	    	@partial_name = 'upcoming'
		  	end
		 end
  	end

	def show
	end

	def new
		@event = Event.new
	end

	def edit
		authorize @event
	end

	def create
	  	authorize @event
	  	@event = current_user.events.new(event_params)

	    respond_to do |format|
	      if params[:spam_filter] == "5" && @event.save
	        format.html { redirect_to @event, notice: 'Event was successfully created.' }
	        format.json { render :show, status: :created, location: @event }
	        #format.ics { render text: @event.to_ics, mime_type: Mime::Type["text/calendar"] }
	      else
	      	flash[:error] = "Spam check fail."
	        format.html { render :new }
	        format.json { render json: @event.errors, status: :unprocessable_entity }
	      end
	    end		
	end

	def update
		authorize @event
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
		authorize @event
		@event.destroy

		respond_to do |format|
			format.html { redirect_to events_url, notice: 'Event was deleted.' }
			format.json { head :no_content }
		end
	end

private

	def set_event
      @event = Event.find(params[:id])
    end

    def event_params
    	params.require(:event).permit(:name,
    								  :start_date,
    								  :end_date,
    								  :website,
    								  :city_id,
    								  :image,
    								  :remove_image
    								  )
    end
    
end
