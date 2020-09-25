class ExpensesController < ApiController
    before_action :require_login

    def index
        expenses_for_event = Expense.where(event_id: params[:event_id])
        render json: { expenses: expenses_for_event }
    end

    def show
        expense = Expense.find params[:id]
        render json: { expense: expense }

        # Leaving this here to remind myself that I have access to user data here
        # render json: { exercise: exercise, username: exercise.user.username }
    end

    def create
        event_for_expense = Event.find(params[:event_id])
        
        expense = event_for_expense.expenses.new(expense_params)

        expense.user = current_user
        
        if expense.save
            render json: { message: 'ok', expense: expense }
        else
            render json: { message: 'Could not create expense' }
        end
    end

    def update
        expense = Expense.find params[:id] 

        if expense.update(expense_params)
            render json: { message: 'ok', expense: expense }
        else
            render json: { message: 'Could not update the expense' }
        end
    end

    def destroy
        expense = Expense.find params[:id]
        expense.destroy
        head :ok
    end

    private
    def expense_params
        params.require(:expense).permit(:name, :amount, :date)
    end
end
