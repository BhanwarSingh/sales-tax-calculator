class SalesTaxCalculatorsController < ApplicationController

  def index
    @total     = session[:total_price].present? ? session[:total_price].map(&:to_f).inject(:+).round(2) : 0.00
    @total_tax = session[:sales_tax].present?   ? session[:sales_tax].inject(:+).round(2)               : 0.00
  end

  def new
  end

  def create
    session[:qty]              = params[:qty]
    session[:item_description] = params[:item_description]
    session[:price]            = params[:shelf_price]

    sales_tax = SalesTax.new(session[:qty], session[:item_description], session[:price])

    session[:total_price], session[:sales_tax] = sales_tax.calculate

    redirect_to sales_tax_calculators_path
  end

end
