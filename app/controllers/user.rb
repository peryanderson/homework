get '/' do
  erb :"sessions/new"
end

post '/sessions' do
  @user = User.authenticate(params[:username], params[:password])
  if @user
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}/show"
  else
    @message = "You did something bad and you should feel bad."
    erb :"sessions/new"
  end
end

get '/users/:user_id/show' do
  @user = User.find_by(id: params[:user_id])
  erb :"users/show"
end


get '/users/new' do
  @user = User.new
  erb :"/users/new"
end

post '/users' do
  @user = User.new(params[:username], params[:password])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}/show"
  else
    @message = "That username is taken"
    erb :"/users/new"
  end
end

get '/logout' do
  session.delete(:user_id)
  redirect '/'
end

