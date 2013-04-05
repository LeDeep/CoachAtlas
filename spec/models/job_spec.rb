require 'spec_helper'

describe Job do 

  context 'validations' do
    it {should validate_presence_of :sport}
    it {should validate_presence_of :listing_title}
    it {should validate_presence_of :gender}
    it {should validate_presence_of :city}
    it {should validate_presence_of :state}
    it {should validate_presence_of :zip_code}
    it {should validate_presence_of :description}
    it {should validate_presence_of :user_id}
    end

  context 'accessibility' do 
    it {should allow_mass_assignment_of :sport}
    it {should allow_mass_assignment_of :listing_title}
    it {should allow_mass_assignment_of :gender}
    it {should allow_mass_assignment_of :city}
    it {should allow_mass_assignment_of :state}
    it {should allow_mass_assignment_of :zip_code}
    it {should allow_mass_assignment_of :description}
    it {should allow_mass_assignment_of :user_id}
  end

  context 'asscociations' do
    it {should belong_to :user}
  end
end
