# responsible for showing user's invoice
class InvoicesController < ApplicationController
  before_action :check_token

  def show
    @order = Order.find(params[:id])
    respond_to do |format|
      format.html do
        redirect_to root_url
      end
      format.pdf do
        # Excluding ".pdf" extension.
        render pdf: "ApplePierog - faktura nr #{@order.id}",
                  template: 'invoices/show.html.haml',
                  show_as_html: params[:debug].present?
      end
    end
  end

  private

  def check_token
    redirect_to root_url unless params[:token] == Order.find(params[:id]).access_token
  end
end
