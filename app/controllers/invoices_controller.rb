class InvoicesController < ApplicationController
  def index
    
    now = Time.new

    @invoice_number = '1'
    @current_year = now.year.to_s

    @transaction_date = now.strftime("%Y-%m-%d")
    @invoicing_date = now.strftime("%Y-%m-%d")

    @buyer_first_name = 'Andrzej'
    @buyer_last_name = 'Jakcinaimie'
    @buyer_street_name = 'Uliczna'
    @buyer_house_no = '15'
    buyer_ap = 5
    @buyer_apartment_no = ( buyer_ap ? '/'+buyer_ap.to_s : '')
    @buyer_zip_code = '90-000'
    @buyer_city_name = 'Łódź'
    @buyer_user_email = 'foo@bar.com'

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "invoices"   # Excluding ".pdf" extension.
      end
    end
  end
end