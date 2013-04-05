class RecreateTables < ActiveRecord::Migration
  def change

    add_column :users, :status, :integer

    remove_column :profiles, :first_name
    remove_column :profiles, :last_name
    remove_column :profiles, :location
    remove_column :profiles, :contact_email
    add_column :profiles, :working_zip_code, :string


    create_table :contact_details do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.references :user
      t.timestamps

    end

    create_table :jobs do |t|
      t.string :listing_title
      t.string :sport
      t.string :gender
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :description
      t.references :user

      t.timestamps
    end
  end
end
