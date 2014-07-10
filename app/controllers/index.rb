get '/' do
  # render home page
  @people = Person.all

  erb :index
end

get '/parties/:party_id/party_goers/:party_goer_id' do
  @party = Party.find(params[:party_id])
  @party_goer = Person.find(params[:party_goer_id])

  erb :show_party_goer, layout: false
end

# post '/parties/:party_id/party_goers/:party_goer_id' do

post '/beerme' do 

  party_goer = Person.find(session[:person_id])
  puts "brew count before: #{party_goer.brew_count}"
  party_goer.brew_count += 1
  party_goer.save
  puts "valid? #{party_goer.errors.messages}"
  puts "brew count after: #{party_goer.brew_count}"
  redirect '/list_partiers'
end

get '/parties/:party_id' do
  @party = Party.find(params[:party_id])

  erb :show_party
end

get '/list_partiers' do
  erb :_list_partiers, layout: false
end



#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page
  @email = nil
  erb :sign_in
end

post '/sessions' do
  # sign-in
  @email = params[:email]
  person = Person.authenticate(@email, params[:password])
  if person
    # successfully authenticated; set up session and redirect
    session[:person_id] = person.id
    redirect '/'
  else
    # an error occurred, re-render the sign-in form, displaying an error
    @error = "Invalid email or password."
    erb :sign_in
  end
end

delete '/sessions/:id' do
  # sign-out -- invoked via AJAX
  return 401 unless params[:id].to_i == session[:person_id].to_i
  session.clear
  200
end


#----------- PEOPLE -----------

get '/people/new' do
  # render sign-up page
  @person = Person.new
  erb :sign_up
end

post '/people' do
  # sign-up
  @person = Person.new params[:person]
  if @person.save
    # successfully created new account; set up the session and redirect
    session[:person_id] = @person.id
    redirect '/'
  else
    # an error occurred, re-render the sign-up form, displaying errors
    erb :sign_up
  end
end

#---------Party

post '/add_party' do 
  @party = Party.create(params[:party])
  @party.person_id = session[:person_id]
  @party.save

  redirect to "/parties/#{@party.id}"
end
