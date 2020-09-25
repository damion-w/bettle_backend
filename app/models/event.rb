class Event < ApplicationRecord
    belongs_to :user
    has_many :expenses
    has_many :usersevents
    has_many :users, through: :usersevents

    def to_json_with_expenses
        expenses =  self.expenses 
        {   id: self.id, 
            name: self.name, 
            date: self.date,
            expenses: expenses 
        }
    end
end
