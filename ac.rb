require 'sinatra'
require 'sqlite3'

get '/' do
  erb :home
end

post '/' do
  @db = SQLite3::Database.new('ac.db')
  @query = params[:query].split(' ').each{|word| word.capitalize!}.join(' ')
  @lookup = @db.execute("select * from item where name = ?", @query).join(',')
  if @lookup != ''
    @result = @lookup + ' bells'
  else
    @result = 'No item by that name.'
  end
  erb :home
end
