class Citizen < ApplicationRecord
    has_secure_password
    validates :email, uniqueness: { case_sensitive: false }

    has_many :comments
    has_many :police_departments, through: :comments

    has_many :reports
    has_many :police, through: :reports
end
