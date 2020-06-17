class Report < ApplicationRecord
    belongs_to :citizen
    belongs_to :police

    has_one :escalation
end
