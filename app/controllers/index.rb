# displays list of all short urls
# provides form for creating a new entry (via long url input info)
get '/' do
  @shorts = Url.pluck(:short)
  erb :index
end

# takes get information, and creates new record in database
post '/urls' do
  @long = params[:long_url]
  @short = Url.get_short(@long)
  puts @short
  erb :confirmation
end

# display long url page from single specific database entry
get '/:short_url' do
  params[:short_url]
end
