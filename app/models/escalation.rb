class Escalation < ApplicationRecord
    has_many :action_takens
    has_many :oversight_agencies, through: :action_takens

    belongs_to :report
end
