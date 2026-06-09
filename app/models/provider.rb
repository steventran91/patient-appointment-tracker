class Provider < ApplicationRecord
    before_validation :generate_token, on: :create

    has_many :appointments
    has_many :patients, through: :appointments
    
    validates :first_name, :last_name, :specialty, :email, presence: true
    validates :email, :token, uniqueness: true

    private
    def generate_token
        self.token = SecureRandom.hex(20)
    end
end
