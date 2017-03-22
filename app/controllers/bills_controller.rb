class BillsController < ApplicationController
 def index
    @bills = Bill.order(:section)
    respond_to do |format|
      format.html
      format.csv { send_data @bills.to_csv }
      
    end
  end
  
  def import
    Bill.import(params[:file])
    
    redirect_to root_url, notice: 'Bills imported.'
  end
end
