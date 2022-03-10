class SalesTaxCalculatorsController < ApplicationController
  def index
    @items        = session[:items]
    @total_tax    = session[:total_tax]
    @total_amount = session[:total_amount]
  end

  def new
    @items = session[:items]
  end

  def create
    session[:items]        = []
    session[:total_tax]    = 0
    session[:total_amount] = 0

    params[:items].each do |item|
      sales_tax = SalesTax.new(item)

      item["total_tax"], item["price_with_tax"] = sales_tax.calculate

      session[:items]        << item
      session[:total_tax]    += item["total_tax"]
      session[:total_amount] += item["price_with_tax"]
    end

    redirect_to sales_tax_calculators_path
  end

end
