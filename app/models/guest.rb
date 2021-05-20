class Guest < ApplicationRecord
  belongs_to :user
  belongs_to :party

  delegate :name, to: :user
end
