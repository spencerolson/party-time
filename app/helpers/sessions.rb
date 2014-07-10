helpers do

  def current_person
    @person ||= Person.find(session[:person_id]) if session[:person_id]
  end

end
