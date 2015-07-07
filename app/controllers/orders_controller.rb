class OrdersController < ApplicationController
     
  before_action :check_availability, only: [:new, :create, :success]
  before_action :authorized, only: [:show]

  def index
    @orders = Order.where(user_id: current_user.id).order(created_at: :desc)
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end
  
  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to success_order_path(@order)
    else
      flash.now[:notice] = 'Błąd, sprawdź czy wszystkie dane są poprawne.'
      render :new
    end
  end
  
  def success
    @order = Order.find(params[:id])
    products_for_email = @order.from_session(session[:cart], @order.id)
    company_data_arr = @order.company_data
    InvoiceMailer.invoice_email(@order, products_for_email, company_data_arr).deliver_now
    session[:cart] = nil
    redirect_to root_path, notice: 'Złożono zamówienie. Szczegóły transakcji wysłano na adres e-mail.'
  end

 
  private
  
  def order_params
    params.require(:order).permit(:user_id, :company_first_name, :company_last_name, :company_street_name, :company_house_no,
    :company_zip_code, :company_city_name, :company_phone_no, :client_first_name, :client_last_name, :client_street_name, :client_house_no,
    :client_apartment_no, :client_zip_code, :client_city_name, :client_phone_no, :client_email, :sum)
  end

  def check_availability
    error=nil
    session[:cart].each do |hash|
      current = Product.find(hash['id'])
      unless current.status == 'dostepny'
        error=1
        flash[:notice] = "#{current.name} jest chwilowo niedostępny. Przepraszamy."
      end
    end
    if error
      redirect_to cart_path
    end
  end

  def authorized
    unless Order.find(params[:id]).user_id==current_user.id
      redirect_to root_path, alert: 'Nie masz uprawnień do przeglądania tej strony.'
    end
  end
  
end
