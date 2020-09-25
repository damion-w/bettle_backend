class EventsController < ApiController
    before_action :require_login

    def index
        events = Event.where(user_id: current_user.id)
        events_with_expenses = events.map { |event| event.to_json_with_expenses }

        render json: { events: events_with_expenses }
    end

    def show
        event = Event.find params[:id]
        render json: { event: event.to_json_with_expenses }

        # Leaving this here to remind myself that I have access to user data here
        # render json: { exercise: exercise, username: exercise.user.username }
    end

    def create
        event = Event.new event_params
        event.user = current_user
        
        if event.save
            render json: { message: 'ok', event: event }
        else
            render json: { message: 'Could not create event' }
        end
    end

    def update
        event = Event.find params[:id] 

        if event.update(event_params)
            render json: { message: 'ok', event: event }
        else
            render json: { message: 'Could not update the event' }
        end
    end

    def destroy
        event = Event.find params[:id]
        event.destroy
        head :ok
    end

    private
    def event_params
        params.require(:event).permit(:name, :date)
    end

end
