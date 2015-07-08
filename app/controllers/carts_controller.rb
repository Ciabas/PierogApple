# responsible for controlling cart
class CartsController < ApplicationController
  before_action :create_cart
  helper_method :count_cartparams

  def additem
    # allows only integers larger than zero, else returns an error
    if params[:quantity].to_i > 0
      # if the product isn't already in cart, add a new item to the cart
      if session[:cart].select { |a| a['id'].to_i == params[:product_id].to_i }.empty?
        session[:cart] << { 'id' => params[:product_id], 'quantity' => params[:quantity] }
      # if the product is already in cart, increment quantity by the number of ordered items
      else
        session[:cart].collect! | a |
          if a['id'].to_i == params[:product_id].to_i
            { 'id' => a['id'], 'quantity' => a['quantity'].to_i + params[:quantity].to_i }
          else
            a
          end
      end
      flash[:notice] = 'Produkt dodany.'
    else
      flash[:error] = 'Błąd. Spróbuj ponownie.'
    end
    cart_count
    redirect_to root_url
  end

  def addoneitem
    product_id = params[:p_id]
    # if the product isn't already in cart, add a new item to the cart
    if session[:cart].select { |a| a['id'].to_i == product_id }.empty?
      session[:cart] << { 'id' => product_id, 'quantity' => 1 }
    # if the product is already in cart, increment quantity by the number of ordered items
    else
      session[:cart].collect! | a |
        if a['id'].to_i == product_id
          { 'id' => a['id'], 'quantity' => a['quantity'].to_i + 1 }
        else
          a
        end
    end
    flash[:notice] = 'Produkt dodany.'
    redirect_to cart_path
  end

  def edititem
    # allows only integers larger than zero, else returns an error
    if params[:quantity].to_i > 0
      # if the product isn't already in cart, add it - it shouldn't happen, but handling is simple
      if session[:cart].select { |a| a['id'] == params[:product_id] }.empty?
        session[:cart] << { 'id' => params[:product_id], 'quantity' => params[:quantity] }
      # if the product is already in cart, set quantity to the submitted one
      else
        session[:cart].collect! | a |
          if a['id'] == params[:product_id]
            { 'id' => a['id'], 'quantity' => params[:quantity].to_i }
          else
            a
          end
      end
      flash[:notice] = 'Produkt zmieniony.'
    else
      flash[:error] = 'Błąd. Spróbuj ponownie.'
    end
    cart_count
    redirect_to cart_path
  end

  def show
    # count the cart value so the navbar aligns perfectly with the view
    cart_count
    # sort the array by item id, so the array aligns with the object list
    session[:cart].sort! { |x, y| x['id'] <=> y['id'] }
    # array containing ids of the items in cart - we'll feed it to the query
    id_array = []
    session[:cart].each do |p|
      id_array << p['id']
    end
    @products = Product.where(id: id_array)
  end

  def removeitem
    # if the product isn't in cart, inform the user
    if session[:cart].select { |a| a['id'] == params[:product_id] }.empty?
      flash[:error] =  'W koszyku nie ma takiego produktu.'
    # if the product is already in cart, remove it
    else
      session[:cart].delete_if { |a| a['id'] == params[:product_id] }
      flash[:notice] = 'Produkt usunięto.'
    end
    cart_count
    redirect_to cart_path
  end

  private

  def cart_params
    params.require(:product_id, :quantity).permit(:product_id, :quantity)
  end

  def create_cart
    session[:cart] = [] unless session[:cart]
  end
end
