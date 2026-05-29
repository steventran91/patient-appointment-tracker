class Patient < ApplicationRecord
    has_many :appointments
    has_many :providers, through: :appointments 

    validates :first_name, :last_name, :email, presence: true 
    validates :email, uniqueness: true 
end
