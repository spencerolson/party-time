require 'bcrypt'

class Person < ActiveRecord::Base
  attr_reader :entered_password

  validates :name, :length => { :minimum => 3, :message => "must be at least 3 characters, fool!" }
  validates :entered_password, :length => { :minimum => 6 }
  validates :email, :uniqueness => true, :format => /.+@.+\..+/ # imperfect, but

  has_many :brews, class_name: "Beer"
  has_many :invitations
  has_many :plans, through: :invitations, source: :party
  has_many :hosted_parties, class_name: "Party"

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(pass)
    @entered_password = pass
    @password = Password.create(pass)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    person = Person.find_by_email(email)
    return person if person && (person.password == password)
    nil # either invalid email or wrong password
  end

  def brews_at_party(party_id)
    self.brews.where(party_id: party_id)
  end
end
