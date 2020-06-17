class ActionTaken < ApplicationRecord
    belongs_to :oversight_agency
    belongs_to :escalation
end
