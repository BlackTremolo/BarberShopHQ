require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "barbershop.db"}

class Client < ActiveRecord::Base 
end 

class Barber < ActiveRecord::Base 
end 

before do 
	@barbers = Barber.all
end
get '/' do
#	@barbers = Barber.all раньше был тут
	erb :index
end

get '/visit' do  
	
	erb :visit
end 

post '/visit' do 
	@user_name = params[:username]
	@phone = params[:phone]
	@date_time = params[:datetime]
	@barber = params[:barber]
	@color = params[:color]

	erb :visit
end	 
