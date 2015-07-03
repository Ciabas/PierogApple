class InvoicesController < ApplicationController
  
  before_action :check_token

  def invoice
    @order=Order.find(params[:id])
    
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "ApplePierog - faktura nr #{@order.id}"   # Excluding ".pdf" extension.
      end
    end
  end

  private
  def check_token
    unless params[:token]==Order.find[:id].access_token
      redirect_to root_url
    end
  end


end
