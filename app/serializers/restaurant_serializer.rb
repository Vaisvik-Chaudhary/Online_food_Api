class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :restaurant_name, :restaurant_city ,:restaurant_description ,:restaurant_contact_number , :restaurant_email , :status , :secure_url , :restaurant_address
  has_many :items

end

