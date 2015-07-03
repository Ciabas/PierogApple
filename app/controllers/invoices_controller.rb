class InvoicesController < ApplicationController
  
  before_action :check_token

  def index
    
    now = Time.new
    
    @invoice_number = '1'
    @current_year = now.year.to_s
    
    @transaction_date = now.strftime("%Y-%m-%d")
    @invoicing_date = now.strftime("%Y-%m-%d")
    
    #static data kept in a hash
    @buyer = {email: "foo@bar.com"}
    @buyer_profile = {first_name: "Andrzej", last_name: "Jakcinaimie", street_name: "Uliczna", house_no: "15", apartment_no: 6, zip_code: "90-210", city_name: "Łódź", phone_no: "500500500"}
    
    @sum = 304.5
    
    
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "faktura"   # Excluding ".pdf" extension.
      end
    end
  end

  private
  def check_token
    #unless params[:token]==Invoices.find[:id].token #that's how it should be done
    unless params[:token]=="aaa"
      redirect_to root_url
    end
  end


end
