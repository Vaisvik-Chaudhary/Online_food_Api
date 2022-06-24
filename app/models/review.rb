class Review < ApplicationRecord
    belongs_to :reviewable, :polymorphic => true

    validates :rating, presence: true, numericality: true
end
