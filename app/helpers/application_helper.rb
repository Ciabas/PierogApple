# responsible for viewing cart on navbar
module ApplicationHelper
  def show_count_items
    (session[:cart_count] ? session[:cart_count]['count_items'] : 0)
  end

  def show_items_value
    (session[:cart_count] ? session[:cart_count]['items_value'] : 0)
  end
end
