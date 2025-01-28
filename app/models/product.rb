class Product < ApplicationRecord
  belongs_to :user
  has_many :deliveries, dependent: :destroy
  has_and_belongs_to_many :categories
end
