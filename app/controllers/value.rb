get '/friend/:id/values', auth: :user do
  moreValues = Value.all.shuffle[0..50]
  erb :'/values/_possiblevalues', locals: {moreValues: moreValues}, layout: false
end


post '/friend/:id/addvalue', auth: :user do
  if params[:value_id]
    Uservalue.find_or_create_by(user_id: params[:id], value_id: params[:value_id])
  else
    newValue = Value.find_or_create_by(word: params[:word].downcase)
    Uservalue.create(user_id: params[:id], value_id: newValue.id)
  end
  valueIDs = Uservalue.where(user_id: params[:id]).map{ |us| us.value_id }
  values = valueIDs.map { |vID| Value.find(vID) }
  erb :'values/_addedvalues', locals: {values: values}, layout: false
end
