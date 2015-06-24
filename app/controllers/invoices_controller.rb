class InvoicesController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "invoices"   # Excluding ".pdf" extension.
      end
    end
  end
end