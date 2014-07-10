class Beer < ActiveRecord::Base
  belongs_to :drinker, class_name: "Person", foreign_key: :person_id
  belongs_to :party
end
