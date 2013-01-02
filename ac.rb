require 'sinatra'
require 'data_mapper'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/ac.db")

class Item
  include DataMapper::Resource

  property :id,     Serial
  property :name,   Text
  property :price,  Integer
  property :type,   Text
end

get '/' do
  erb :home
end

post '/' do
  params[:query]
end
