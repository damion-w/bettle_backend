class Expense < ApplicationRecord
    belongs_to :user
    belongs_to :event

    has_many :usersexpenses
    has_many :users, through: :usersexpenses
end