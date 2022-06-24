class Item < ApplicationRecord
  belongs_to :restaurant
  has_and_belongs_to_many :carts
  has_many :cartitems
  has_many_attached :foodimages
  has_many :reviews, :as => :reviewable 
  

  validates :item_name, presence: true
  validates :item_price, presence: true, numericality: true
  validates :item_category, presence: true
  validates :item_description, presence: true, length: {minimum:50, maximum:500}
  validates :item_status, presence: true

end

