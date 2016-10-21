class Review < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :station_id, presence: true

  belongs_to :station
end
