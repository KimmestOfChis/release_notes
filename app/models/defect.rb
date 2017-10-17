class Defect < ApplicationRecord
  belongs_to :iteration, optional: true
end
