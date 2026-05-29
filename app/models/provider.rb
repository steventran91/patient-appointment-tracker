class Provider < ApplicationRecord
    validates :first_name, :last_name, :specialty, :email, presence: true
    validates :email, uniqueness: true
end
