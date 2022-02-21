module ApplicationHelper
	def calculate_price_with_tax 
		arr = ['book','chocolate', 'headache']
		p_tax = 0;
		p_tax_imp = 0;
		updated_price ||= []
		sales_tax ||= []
		if session[:qty].present?

			session[:qty].each_with_index do |item, index|

				description = session[:item_description][index].downcase
				price = session[:price][index].to_f
				if description.include?('imported')
					p_tax_imp = (price * 5) / 100
				end
				is_exist = false
				arr.each do |word|
					if description.include? word
						is_exist = true
					end
				end	

				if is_exist.present?
					updated_price << price + p_tax_imp
					sales_tax << p_tax_imp
				else
					p_tax = (price * 10) / 100
					updated_price << price + p_tax_imp + p_tax
					sales_tax << p_tax_imp + p_tax
				end
			end
		end
		session[:total_price] = updated_price
		session[:sales_tax] = sales_tax
	end


	def currency_dropdown 
		[['EUR', 'EUR'], ['INR', 'INR'], ['USD', 'USD']]
	end

end
