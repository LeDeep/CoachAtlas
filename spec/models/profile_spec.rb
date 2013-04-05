require 'spec_helper'

describe Profile do 

  context 'validations' do
    it {should validate_presence_of :gender}
    it {should validate_presence_of :sport}
    it {should validate_presence_of :working_zip_code}
    it {should validate_presence_of :bio}
    it {should validate_presence_of :user_id}
    end

  context 'accessibility' do 
    it {should allow_mass_assignment_of :gender}
    it {should allow_mass_assignment_of :sport}
    it {should allow_mass_assignment_of :working_zip_code}
    it {should allow_mass_assignment_of :bio}
    it {should allow_mass_assignment_of :user_id}
    it {should allow_mass_assignment_of :picture}
  end

  context 'asscociations' do
    it {should belong_to :user}
  end
end