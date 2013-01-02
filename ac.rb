require 'sinatra'
require 'sqlite3'

db = SQLite3::Database.new( 'ac.db' )

get '/' do
  erb :home
end

post '/' do
  params[:query]
end
