class Defect < ApplicationRecord
  belongs_to :iteration, optional: true
  validates :defect_no, uniqueness: true
end
