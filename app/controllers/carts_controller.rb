class CartsController < ApplicationController

  before_action :create_cart

  def additem
    #allows only integers larger than zero, else returns an error
    if params[:quantity].to_i>0
      #if the product isn't already in cart, add a new item to the cart
      if session[:cart].select{|a| a["id"]==params[:product_id]}.empty?
        session[:cart].push({id: params[:product_id], quantity: params[:quantity]})
      #if the product is already in cart, increment quantity by the number of ordered items
      else
        session[:cart].collect! {|a| (a["id"]==params[:product_id]) ? {id: a["id"], quantity: a["quantity"].to_i+params[:quantity].to_i} : a }
      end
      redirect_to root_url, notice: 'Produkt dodany.'
    else
      redirect_to root_url, error: 'Błąd. Spróbuj ponownie.'
    end
  end

  def edititem
    #allows only integers larger than zero, else returns an error
    if params[:quantity].to_i>0
      #if the product isn't already in cart, add it - it shouldn't happen, but handling is simple
      if session[:cart].select{|a| a["id"]==params[:product_id]}.empty?
        session[:cart].push({id: params[:product_id], quantity: params[:quantity]})
      #if the product is already in cart, set quantity to the submitted one
      else
        session[:cart].collect! {|a| (a["id"]==params[:product_id]) ? {id: a["id"], quantity: params[:quantity].to_i} : a }
      end
      redirect_to cart_path, notice: 'Produkt zmieniony.'
    else
      redirect_to cart_path, error: 'Błąd. Spróbuj ponownie.'
    end
  end  

  def show
    #sort the array by item id, so the array aligns with the object list
    session[:cart].sort! {|x,y| x['id']<=>y['id']}
    #array containing ids of the items in cart - we'll feed it to the query
    id_array = Array.new
    session[:cart].each do |p|
      id_array.push(p['id'])
    end
    @products=Product.where(id: id_array)
  end

  def removeitem
    #if the product isn't in cart, inform the user
    if session[:cart].select{|a| a["id"]==params[:product_id]}.empty?
      redirect_to cart_path, error: 'W koszyku nie ma takiego produktu.'
    #if the product is already in cart, remove it
    else
      session[:cart].delete_if {|a| a["id"]==params[:product_id] }
      redirect_to cart_path, notice: 'Produkt usunięto.'
    end
  end

  private
  def cart_params
    params.require(:product_id,:quantity).permit(:product_id,:quantity)
  end

  def create_cart
    if session[:cart].nil?
      session[:cart] = []
    end
  end

end
