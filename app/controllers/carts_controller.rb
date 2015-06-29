class CartsController < ApplicationController

  before_action :create_cart

  def additem
    if session[:cart].select{|a| a["id"]==params[:product_id]}.empty?
      session[:cart].push({id: params[:product_id], quantity: params[:quantity]})
    else
      session[:cart].collect! {|a| (a["id"]==params[:product_id]) ? {id: a["id"], quantity: a["quantity"].to_i+params[:quantity].to_i} : a }
    end
    
    redirect_to root_url, notice: 'Produkt dodany'
  end

  def show
    
  end

  def destroy

  end

  private
  def cart_params
    params.require(:product_id,:quantity)
  end

  def create_cart
    if session[:cart].nil?
      session[:cart] = []
    end
  end

end
