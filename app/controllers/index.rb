get '/' do
 
  erb :index
end

get '/secret_page' do
  if session[:id] 
    erb :secret
  else
    redirect to ('/create_user')
  end
end

get '/create_user' do
  erb :create
end

get '/logout' do
  session.clear
  erb :index
end

#=======POST

post '/login' do

  email = params[:email]
  password = params[:password]
  @sample = User.find_by_email(email)
  if @sample 
    @user = User.authenticate(email, password)
    if @user 
      session[:id] = @user.id
      redirect to ('/secret_page')
    else 
      redirect to ('/')
    end
  else
    redirect to ('/')
  end
end

post '/create_user' do
  email = params[:email]
  password = params[:password]
  @current_user = User.new(email: email, password: password)
  if @current_user.save
    session[:id] = @current_user.id
    redirect to ('/secret_page')
  else 
    erb :create
  end
end


