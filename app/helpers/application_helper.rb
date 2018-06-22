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
end
