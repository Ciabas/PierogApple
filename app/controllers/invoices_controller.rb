class InvoicesController < ApplicationController
  def index
    @buyer_first_name = 'Andrzej'
    @buyer_last_name = 'Jakcinaimie'
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "invoices"   # Excluding ".pdf" extension.
      end
    end
  end
end