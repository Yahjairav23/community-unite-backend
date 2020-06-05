class Comment < ApplicationRecord
    belongs_to :citizen
    belongs_to :police_department
end
