class BillImportsController < ApplicationController
   def new
    @bill_import = BillImport.new
  end

  def create
    @bill_import = BillImport.new(params[:bill_import])
    if @bill_import.save
      redirect_to root_url, notice: "Imported bills successfully."
    else
      render :new
    end
  end
end
