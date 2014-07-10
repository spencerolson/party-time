class AddPartyIdToBeers < ActiveRecord::Migration
  def change
    add_column :beers, :party_id, :integer
  end
end
