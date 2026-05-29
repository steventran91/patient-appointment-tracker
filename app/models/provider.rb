class Provider < ApplicationRecord
    has_many :appointments
    has_many :patients, through: :appointments
    
    validates :first_name, :last_name, :specialty, :email, presence: true
    validates :email, uniqueness: true
end
