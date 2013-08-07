get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/urls' do

  erb :confirmation
end

get '/:short_url' do
  params[:short_url]
end
