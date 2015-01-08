get '/values', auth: :user do
  moreValues = Value.all.shuffle[0..50]
  erb :'/values/_possiblevalues', locals: {moreValues: moreValues}, layout: false
end


post '/addvalue', auth: :user do
  p params
  p params[:value_id]
  if params[:value_id]
    Uservalue.find_or_create_by(user_id: params[:friend_id], value_id: params[:value_id])
    p "find_or_create_by"
  else
    newValue = Value.find_or_create_by(word: params[:word].downcase)
    Uservalue.create(user_id: params[:friend_id], value_id: newValue.id)
    p newValue
    p newValue.id

  end
  valueIDs = Uservalue.where(user_id: params[:friend_id]).map{ |us| us.value_id }
  p Uservalue.where(user_id: params[:friend_id])
  erb :'values/_addedvalues', locals: {valueIDs: valueIDs}, layout: false
end
