class QueryController < ApplicationController
  def edit
  	@cities = City.all.map { |city| city.name } 	
  end

  def result
  	@city = City.where(:name => params[:location]).first

  	@rank = params[:rank?].nil?

  	@places = @city.places.find_all do |place|
  		avg_price = place.avg_price
  		(avg_price - 100) <= params[:avg_price].to_f and (avg_price + 100) >= params[:avg_price].to_f
  	end
  end
end
