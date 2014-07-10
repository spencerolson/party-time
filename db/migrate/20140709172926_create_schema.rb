class CreateSchema < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :email
      t.string :password_hash
      t.integer :brew_count, default: 0 
      t.timestamps
    end

    create_table :beers do |t|
      t.string :type
      t.integer :person_id
      t.timestamps
    end

    create_table :parties do |t|
      t.string :theme
      t.integer :person_id
      t.timestamps
    end

    create_table :invitations do |t|
      t.integer :person_id, :party_id
      t.timestamps
    end
  end
end
