module Admin
  # responsible for showing invoices to admin
  class InvoicesController < Admin::AdminController
    def show
      @order = Order.find(params[:id])
      respond_to do |format|
        format.html do
          redirect_to admin_orders_path, notice: 'Niewłaściwy format'
        end
        format.pdf do
          # Excluding ".pdf" extension.
          render pdf: "ApplePierog - faktura nr #{@order.id}", template: 'invoices/show.html.haml'
        end
      end
    end
  end
end
