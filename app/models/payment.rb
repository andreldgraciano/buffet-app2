class Payment < ApplicationRecord
  has_and_belongs_to_many :buffets

  validates :name, presence: true, uniqueness: true
end
