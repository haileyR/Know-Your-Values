get '/' do
  erb :index
end

post '/login' do
  user = User.find_by(name: params[:user][:name])
  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    erb :'user/_logedin', layout: false
  else
    session[:error] = "Invalid Login Information"
    erb :'user/_logedout', layout: false
  end
end

get '/register' do
  erb :'user/_register', layout: false
end

post '/register' do
  user = User.create(params[:user])
  session[:user_id] = user.id
  erb :'user/_logedin', layout: false
end

get '/logout' do
  session[:user_id] = nil
  erb :'user/_logedout', layout: false
end