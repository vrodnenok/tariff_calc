class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end

# Tariff  gas:float cold_water:float hot_water:float electro:float comment:string
# Counter gas:float cold_water:float hot_water:float electro:float comment:string belongs_to:tariff tariff:references