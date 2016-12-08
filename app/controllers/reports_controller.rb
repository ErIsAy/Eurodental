class ReportsController < ApplicationController
  def index
  end

  def orders_unpaid
    # @sales = Sale.all
    @search = Sale.where(:paid_status => false).ransack(params[:q])
    @sales = @search.result.page(params[:page]).per_page(15)


  end

  def orders_paid
    # @sales = Sale.all
    @search = Sale.where(:paid_status => true).ransack(params[:q])
    @sales = @search.result.page(params[:page]).per_page(15)
  end

  def pending_balance
    # @sales = Sale.all
    # @clients = Client.all
    @search = Sale.where(:paid_status => false).ransack(params[:q])
    @sales = @search.result.page(params[:page]).per_page(15)
  end



  def orders_unpaid_print
    @search = Sale.where(:paid_status => false).ransack(params[:q])
    @sales = @search.result.page(params[:page])

    @from = params[:q][:created_at_date_gequals]
    @to = params[:q][:created_at_date_lequals]

    respond_to do |format|
      # format.html
      format.pdf do
      pdf = ReportUnpaid.new(@sales,@from,@to)
      send_data pdf.render,
        filename: "OrdenesPorPagar_#{@from}_#{@to}.pdf",
        type: "application/pdf",
        disposition: "inline" ##display in browser
      end
    end
  end

  def orders_paid_print
    @search = Sale.where(:paid_status => true).ransack(params[:q])
    @sales = @search.result.page(params[:page])

    @from = params[:q][:created_at_date_gequals]
    @to = params[:q][:created_at_date_lequals]

    respond_to do |format|
      # format.html
      format.pdf do
      pdf = ReportBalance.new(@sales,@from,@to)
      send_data pdf.render,
        filename: "OrdenesConsolidadas_#{@from}_#{@to}.pdf",
        type: "application/pdf",
        disposition: "inline" ##display in browser
      end
    end
  end

  def pending_balance_print
    @search = Sale.where(:paid_status => false).ransack(params[:q])
    @sales = @search.result.page(params[:page])

    @from = params[:q][:created_at_date_gequals]
    @to = params[:q][:created_at_date_lequals]

    respond_to do |format|
      # format.html
      format.pdf do
      pdf = ReportBalance.new(@sales,@from,@to)
      send_data pdf.render,
        filename: "BalancePendientes#{@from}_#{@to}.pdf",
        type: "application/pdf",
        disposition: "inline" ##display in browser
      end
    end
  end
end
