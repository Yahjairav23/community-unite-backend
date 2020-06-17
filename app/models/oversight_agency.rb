class OversightAgency < ApplicationRecord
    has_secure_password
    validates :email, uniqueness: { case_sensitive: false }

    has_many :action_takens
    has_many :escalations, through: :action_takens
end