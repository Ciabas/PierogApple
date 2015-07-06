class InvoiceMailer < ApplicationMailer
  default from: "pierogapple@inbox.com"
  layout 'mailer'

  def invoice_email(order, orderproducts, company_data)   
    @adress = order.client_email
    @products_for_email = orderproducts
    @company_data = company_data
    @sum = order.sum
    mail(to: @adress, subject: 'Zamówienie numer ' + order.id.to_s)
  end
end
