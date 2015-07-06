class InvoicesController < ApplicationController
  
  before_action :check_token

  def show
    @order=Order.find(params[:id])
    respond_to do |format|
      format.html do
        redirect_to root_url
      end
      format.pdf do
        render pdf: "ApplePierog - faktura nr #{@order.id}", :template => 'invoices/show.html.haml'   # Excluding ".pdf" extension.
      end
    end
  end

  private
  def check_token
    unless params[:token]==Order.find(params[:id]).access_token
      redirect_to root_url
    end
  end

end
