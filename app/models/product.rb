class Product < ActiveRecord::Base
  belongs_to :user
  validates :name, :description, :price, presence: true
end
