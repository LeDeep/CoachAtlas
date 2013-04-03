class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :sport
      t.string :gender
      t.string :location
      t.string :contact_email
      t.string :bio
      t.references :user

      t.timestamps

    end
  end
end