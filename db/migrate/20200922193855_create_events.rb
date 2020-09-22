class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.belongs_to :user
      
      t.timestamps
    end
  end
end
