class Admin::InvoicesController < Admin::AdminController
  
  def show
    @order=Order.find(params[:id])
    respond_to do |format|
      format.html do
        redirect_to admin_orders_path, notice: 'Niewłaściwy format'
      end
      format.pdf do
        render pdf: "ApplePierog - faktura nr #{@order.id}", :template => 'invoices/show.html.haml'   # Excluding ".pdf" extension.
      end
    end
  end

end
