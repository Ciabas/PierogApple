class OrdersController < ApplicationController
     
  def new
    @order = Order.new
  end
  
  def create
    @order = Order.new(order_params)
    if @order.save
      session[:cart] = nil
      redirect_to root_path, notice: 'Złożono zamówienie. Szczegóły transakcji wysłano na adres e-mail.'
    else
      flash.now[:notice] = 'Błąd, sprawdź czy wszystkie dane są poprawne.'
      render :new
    end
  end
  
  private
  
  def order_params
    params.require(:order).permit(:user_id, :company_first_name, :company_last_name, :company_street_name, :company_house_no,
    :company_zip_code, :company_city_name, :company_phone_no, :client_first_name, :client_last_name, :client_street_name, :client_house_no,
    :client_apartment_no, :client_zip_code, :client_city_name, :client_phone_no, :sum)
  end
  
end
