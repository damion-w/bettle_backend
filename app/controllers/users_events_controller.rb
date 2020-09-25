class UsersEventsController < ApiController
    before_action :require_login

    def create
        event_id = params[:event_id]
        
        username = user_event_params["username"]
        user = User.find_by username: username
        user_id = user.id

        users_event = UsersEvent.create!({ user_id: user_id, event_id: event_id })

        render json: { message: 'ok', user_event: users_event }
    end

    def update
        event_id = params[:event_id]
        user_event = UsersEvent.find_by event_id: event_id
        
        username = user_event_params["username"]
        user = User.find_by username: username
        user_id = user.id

        if user_event.update({ event_id: event_id, user_id: user_id })
            render json: { message: 'ok', user_event: user_event }
        else
            render json: { message: 'Could not update user_event' }
        end
    end

    def destroy
        username = user_event_params["username"]
        user = User.find_by username: username
        user_id = user.id
        user_event = UsersEvent.find_by user_id: user_id
        user_event.destroy
        head :ok
    end

    private
    
    def user_event_params
        params.require(:user_event).permit(:username)
    end
end
