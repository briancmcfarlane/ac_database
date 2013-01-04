require 'sinatra'
require 'sqlite3'

def titlecase_each_word(mixed_case_string)
  titlecase_string = mixed_case_string.split(' ').each{|word| word.capitalize!}.join(' ')
  return titlecase_string
end

get '/' do
  erb :home
end

post '/' do
  @db = SQLite3::Database.new('ac.db')
  @query = titlecase_each_word(params[:query])
  @price = @db.execute("select price from item where name = ?", @query).join(',')
  if @price != ''
    @result = 'A ' + @query.downcase + ' will fetch ' + @price + ' bells.'
  else
    @result = 'No item by that name.'
  end
  erb :home
end
