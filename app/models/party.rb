class Party < ApplicationRecord
  belongs_to :host, class_name: 'User'
  has_many :guests, dependent: :destroy

  validates :host_id, presence: true, numericality: true
  validates :movie_id, presence: true, numericality: true
  validates :duration, presence: true, numericality: true
  validates :date, presence: true
  validates :start_time, presence: true
  validates :title, presence: true
end
