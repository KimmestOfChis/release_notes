class Iteration < ApplicationRecord
    has_many :defects
    has_many :interactions
end
