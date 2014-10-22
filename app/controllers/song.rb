get '/songs' do
  @songs = Song.all
  erb :"songs/all"
end

get '/songs/:song_id/edit' do
  @song = Song.find_by(id: params[:song_id])
  @genres = Genre.all
  erb :"songs/edit"
end


get '/songs/new' do
  @song = Song.new
  erb :"/songs/new"
end

post '/songs/' do
  @song = Song.create(params[:song])
  redirect '/songs'
end

  # @song.update_attributes(params[:song])
put '/songs/:song_id' do
  @song = Song.find_by(id: params[:song_id])
  @song.update_attributes(params[:song])
  redirect '/songs'
end

delete '/songs/:song_id' do
  @song = Song.find_by(id: params[:song_id])
  @song.delete
  redirect '/songs'
end
