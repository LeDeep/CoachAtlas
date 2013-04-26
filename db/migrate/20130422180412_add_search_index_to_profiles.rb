class AddSearchIndexToProfiles < ActiveRecord::Migration
  def up
    execute "create index profiles_working_zip_code on profiles using gin(to_tsvector('english', working_zip_code))"  end

  def down
    execute "drop index profiles_working_zip_code"
  end
end
