class InvoiceMailer < ApplicationMailer
  def invoice_email(order, orderproducts, company_data)   
    @adress = order.client_email
    @products_for_email = orderproducts
    @company_data = company_data
    @sum = order.sum
    @order_id = order.id
    @access_token = order.access_token
    mail(to: @adress, subject: 'Zamówienie numer ' + order.id.to_s)
  end
end
