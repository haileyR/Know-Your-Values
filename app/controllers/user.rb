put '/profile', auth: :user do
  current_user.update(bio: params[:newbio])
end


get '/friend/:id', auth: :user do
  ship = Friendship.find_by(user_id: current_user.id, friend_id: params[:id])
  if ship && ship.status
    friend = User.find(params[:id])
    moreValues = Value.all.shuffle[0..50]
    values = Uservalue.values_of_user(params[:id])
    erb :'/values/friendvalues', locals: {friend: friend, values: values, moreValues: moreValues}
  else
    redirect :'/'
  end
end

get '/friends', auth: :user do
  friends = Friendship.friends(current_user.id)
  erb :'user/_friendslist', locals: {friends: friends, button: "unfriend"}, layout: false
end

get '/searchfriends', auth: :user do
  friends = User.where(email: params[:email])
  erb :'user/_friendslist', locals: {friends: friends, button: "add"}, layout: false
end

get '/friendrequests', auth: :user do
  friends = Friendship.friend_requests(current_user.id)
  erb :'user/_friendslist', locals: {friends: friends, button: "add"}, layout: false
end

put '/friends', auth: :user do
  Friendship.create(user_id: current_user.id, friend_id: params[:friend_id])
  friends = []
  erb :'user/_friendslist', locals: {friends: friends, button: "add"}, layout: false
end

delete '/friends', auth: :user do
  my_friendship = Friendship.find_by(user_id: current_user.id, friend_id: params[:friend_id]).destroy
  fri_friendship = Friendship.find_by(user_id: params[:friend_id], friend_id: current_user.id).destroy

  friends = Friendship.friends(current_user.id)

  erb :'user/_friendslist', locals: {friends: friends, button: "unfriend"}, layout: false
end