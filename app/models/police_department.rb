class PoliceDepartment < ApplicationRecord
    has_many :police
    has_many :reports, through: :police

    has_many :comments
    has_many :citizens, through: :comments
end
