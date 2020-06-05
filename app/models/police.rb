class Police < ApplicationRecord
    belongs_to :police_department

    has_many :reports
    has_many :citizens, through: :reports
end
