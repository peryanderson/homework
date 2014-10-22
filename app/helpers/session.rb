
def current_user
  User.find(session[:user_id])
end

def authenticated?
  session[:user_id] != nil
end
