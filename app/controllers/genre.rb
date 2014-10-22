get '/genres' do
  @genres = Genre.all
  erb :"genres/index"
end

get '/genres/new' do
  @genres = Genre.new
  erb :"genres/new"
end

post '/genres' do
  @genres = Genre.new(title: params[:title])
  redirect to "/genres/index"
end
