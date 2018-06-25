module ApplicationHelper
    def logged_in?(user)
        user.email if user && user.email.present?
    end

    def empty_cart?(cart)
        cart.length < 1
    end

    def sold_out?(product)
        product.quantity < 1
    end

    def email_to_include (user)
        user == nil ? "Guest" : user.email
    end

    def find_email_by_id(id)
        User.find_by(id: id).email
    end

    def create_rating_stars(int)
        stars = ''
        for counter in 1..int.to_i
            stars += "☆"
        end
        stars
    end

    def reviews_path
        product_reviews_path @product
    end

end
