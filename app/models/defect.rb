class Defect < ApplicationRecord
  belongs_to :iteration
  validates :defect_no, uniqueness: true
end
