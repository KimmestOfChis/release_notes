class Line < ApplicationRecord
    has_many :users
    validates :line_name, presence: true, uniqueness: { notice: "Line already exists!"}
end
