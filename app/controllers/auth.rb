get '/' do
  yourvalues = current_user ? Uservalue.values_of_user(current_user.id) : nil
  erb :'index', locals: {yourvalues: yourvalues}
end

post '/login' do
  user = User.find_by(email: params[:user][:email])
  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    yourvalues = Uservalue.values_of_user(current_user.id)
    redirect :'/', locals: {yourvalues: yourvalues}
  else
    session[:error] = "Invalid Login Information"
    erb :'index'
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