class InvoiceMailer < ApplicationMailer
  default from: "pierogapple@inbox.com"
  layout 'mailer'

  def invoice_email(user)
    @user = user
    mail(to: @user.email, subject: 'Twoja faktura z PierogApple')
  end
end
