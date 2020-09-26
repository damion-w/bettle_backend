class UsersExpensesController < ApiController
    before_action :require_login

    def create
        expense_id = params[:expense_id]
        
        username = user_expense_params["username"]
        user = User.find_by username: username
        user_id = user.id

        user_expense = UsersExpense.create!({ user_id: user_id, expense_id: expense_id, is_paid: false })

        render json: { message: 'ok', user_expense: user_expense }
    end

    def update
        expense_id = params[:expense_id]
        user_expense = UsersExpense.find_by expense_id: expense_id
        
        username = user_expense_params["username"]
        user = User.find_by username: username
        user_id = user.id

        if user_expense.update({ expense_id: expense_id, user_id: user_id, is_paid: user_expense_params["is_paid"] })
            render json: { message: 'ok', user_expense: user_expense }
        else
            render json: { message: 'Could not update user_expense' }
        end
    end

    def destroy
        username = user_expense_params["username"]
        user = User.find_by username: username
        user_id = user.id
        user_expense = UsersExpense.find_by user_id: user_id
        user_expense.destroy
        head :ok
    end

    private
    
    def user_expense_params
        params.require(:user_expense).permit(:username, :is_paid)
    end

end
