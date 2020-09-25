class CreateUsersExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :users_expenses do |t|
      t.belongs_to :user
      t.belongs_to :expense
      t.boolean :is_paid

      t.timestamps
    end

    add_index :users_expenses,  [:expense_id, :user_id], unique: true

  end
end
