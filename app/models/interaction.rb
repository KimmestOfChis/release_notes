class Interaction < ApplicationRecord
    belongs_to :iteration
    validates :interaction_name, presence: true, uniqueness: true
end
