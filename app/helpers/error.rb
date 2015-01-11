def display_session_error
  error = session[:error]
  session[:error] = nil
  error
end