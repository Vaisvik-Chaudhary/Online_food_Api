class Restaurant < ApplicationRecord
    has_many :items
    has_one_attached :rest_image
    has_many :reviews, :as => :reviewable
  
   

    validates :restaurant_name, presence: true
    validates :restaurant_address, presence: true
    validates :restaurant_contact_number, presence: true, length: { is:10 }
    validates :restaurant_description, presence: true
    validates :restaurant_city, presence: true 
    validates :restaurant_email, presence:true, uniqueness: true
    validates :user_id, uniqueness: true
end
