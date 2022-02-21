class SalesTaxCalculatorsController < ApplicationController
  include ApplicationHelper
  def index
    # byebug

    # file = File.open(Rails.root.join('public/export_sales_report.txt'), 'w')

    # #Product.order(:id).find_each do |product|
    #   file.write('Dharmendra Solanki')
    #   file.write("\n")
    # #end

    # file.download

    @total = session[:total_price].present? ? session[:total_price].map(&:to_f).inject(:+).round(2) : 0.00

    @total_tax =  session[:sales_tax].present? ? session[:sales_tax].inject(:+).round(2) : 0.00
  end

  def new
  end

  def create
    session[:qty] = params[:qty]  
    session[:item_description] = params[:item_description]  
    session[:price] = params[:shelf_price]  

    calculate_price_with_tax
    redirect_to '/sales_tax_calculators'
  end
end
