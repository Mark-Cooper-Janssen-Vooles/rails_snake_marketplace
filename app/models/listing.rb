class Listing < ApplicationRecord
  belongs_to :breed

  enum sex: { female: 0, male: 1, non_binary: 2 }

  validates :title, :description, :sex, :price, :deposit, :city, :date_of_birth, :breed, :diet, presence: true

  validates :deposit, numericality: { less_than_or_equal_to: :price, message: " must be less than or equal to the price."}

  validates :state, inclusion: { in: %w(VIC NSW WA TAS NT ACT QLD SA), message: "%{value} is not a valid state" }
  # validates :state, format: { with: /[A-Z][A-Z][A-Z]/, message: "only allows 3 capital letters" }

  has_one_attached :picture 
  
  belongs_to :user
end