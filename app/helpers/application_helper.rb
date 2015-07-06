module ApplicationHelper
 
  def get_count_items
    (session[:cart_count] ? session[:cart_count]['count_items'] : 0)
  end

  def get_items_value
    (session[:cart_count] ? session[:cart_count]['items_value'] : 0)
  end
  
end
