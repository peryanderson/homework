get '/' do
  erb :"users/index"
end

post '/sessions' do
  @user = User.authenticate(params[:username], params[:password])
  if @user
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @message = "You did something bad and you should feel bad."
    erb :"sessions/new"
  end
end


get '/users/new' do
  @user = User.new()
  erb :"/users/new"
end

get '/users/:user_id' do
  @user = User.find_by(id: params[:user_id])
  erb :"/users/show"
end

post '/users' do
  @user = User.new(username: params[:username], password: params[:password])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @message = "That username is taken"
    erb :"/users/new"
  end
end

delete '/logout' do
  session.delete(:user_id)
  redirect '/'
end

