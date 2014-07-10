require 'faker'

# create a few users

party = Party.create :theme => "Durkins", :person_id => 1

15.times do
  party.party_goers << Person.create(:name => Faker::Name.name, :email => Faker::Internet.email, :password => 'password')
end



# TODO: create associations between users and skills
