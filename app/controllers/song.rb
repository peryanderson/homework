get '/songs' do
  @songs = Song.all
  erb :"songs/index"
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

post '/songs' do
  @song = Song.new(params[:song])
  redirect '/songs'
end

put '/songs/:song_id' do
  @song = Song.find_by(id: params[:song_id])
  @song.update_attributes(params[:song])
  genres = params[genre]
  genres.each do |genre|
    @song.genres << Genre.find_by(title: genre)
  end
  redirect '/songs'
end

delete '/songs/:song_id' do
  @song = Song.find_by(id: params[:song_id])
  @song.delete
  redirect '/songs'
end
