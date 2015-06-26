class CartsController < ApplicationController

  def additem
    if session[:cart].nil?
      session[:cart] = [ {id: params[:product_id], quantity: params[:quantity]} ]
    else
      if session[:cart].select{|a| a["id"]==params[:product_id]}.empty?
        session[:cart].push({id: params[:product_id], quantity: params[:quantity]})
      else
        session[:cart].collect! {|a| (a["id"]==params[:product_id]) ? {id: a["id"], quantity: a["quantity"].to_i+params[:quantity].to_i} : a }
      end
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
end
