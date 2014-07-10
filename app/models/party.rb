class Party < ActiveRecord::Base
  belongs_to :host, class_name: "Person", foreign_key: :person_id

  has_many :beers
  has_many :invitations
  has_many :party_goers, through: :invitations, source: :person

end
