class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.string :name
      t.decimal :amount
      t.date :date

      t.belongs_to :user
      t.belongs_to :event

      t.timestamps
    end
  end
end
