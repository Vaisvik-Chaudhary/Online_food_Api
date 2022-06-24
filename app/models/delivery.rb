class Delivery < ApplicationRecord
    belongs_to :user

    validates :deliveryman_name, presence: true
    validates :deliveryman_city, presence: true
    validates :deliveryman_number, presence: true, length: { is: 10 }, numericality: true
    validates :user_id, uniqueness: true
end
