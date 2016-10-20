class Station < ApplicationRecord

  validates :name, presence: true
  validates :line, presence: true
  validates :state, presence: true
end
