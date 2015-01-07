get '/' do
  erb :index
end

post '/login' do
  user = User.find_by(email: params[:user][:email])
  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect :'/'
  else
    session[:error] = "Invalid Login Information"
    erb :'user/_logedout'
  end
end

get '/register' do
  erb :'user/_register', layout: false
end

post '/register' do
  user = User.create(params[:user])
  user.update(bio: "Edit bio...")
  session[:user_id] = user.id
  redirect :'/'
end

get '/logout' do
  session[:user_id] = nil
  redirect :'/'
end