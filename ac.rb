require 'sinatra'
require 'sqlite3'

get '/' do
  erb :home
end

post '/' do
  @db = SQLite3::Database.new('ac.db')
  @lookup = @db.execute("select price from item where name = ?", params[:query]).join("")
  if @lookup != ''
    @result = @lookup + ' bells'
  else
    @result = 'No item by that name.'
  end
  erb :home
end
