class Review < ActiveRecord::Base
    belongs_to :product
    belongs_to :user

    validates :user_id,    presence:{message: "user_id not present"}
    validates :product_id, presence: {message: "product_id not present"}
    validates :rating,  presence: {message: "rating not present"}

end
