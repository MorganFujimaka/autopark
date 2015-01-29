module ProductsHelper
  def add_product
    if user_signed_in? && current_user.is_admin
      content_tag :p do
        link_to "Add product", new_product_path, class: "btn btn-primary btn-small"
      end
    end
  end
end
