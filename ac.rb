require 'sinatra'

get '/' do
  erb :home
end

post '/' do
  params[:query]
end
