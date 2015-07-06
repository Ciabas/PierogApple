class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  protected
  
  def cart_count
  #set counting variable to 0, iterate through the cart elements, add their values to the variables
  count=0
  value=0

  if session[:cart]
    session[:cart].each do |p|
      if p['id']
        count += p['quantity'].to_i
        value += Product.find(p['id']).price * p['quantity'].to_i
      end
    end
  end
  session[:cart_count] = {'count_items' => count, 'items_value' => value}
end
  
end
