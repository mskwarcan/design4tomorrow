class CreateSignUps < ActiveRecord::Migration

  def self.up
    create_table :sign_ups do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :organization
      t.string :plan
      t.string :deadline
      t.string :current_site
      t.text :information
      t.text :additional
      t.integer :position

      t.timestamps
    end

    add_index :sign_ups, :id

    load(Rails.root.join('db', 'seeds', 'sign_ups.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "sign_ups"})

    Page.delete_all({:link_url => "/sign_ups"})

    drop_table :sign_ups
  end

end
