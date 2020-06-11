class Police < ApplicationRecord
    has_secure_password
    validates :badge_number, uniqueness: { case_sensitive: false }

    belongs_to :police_department

    has_many :reports
    has_many :citizens, through: :reports
end
