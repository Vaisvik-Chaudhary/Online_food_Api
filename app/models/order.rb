class Order < ApplicationRecord
   
    belongs_to :user

    validates :address, presence: true
    validates :item_quantity, presence: true
end
