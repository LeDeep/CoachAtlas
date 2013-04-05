require 'spec_helper'

describe ContactDetail do 

  context 'validations' do
    it {should validate_presence_of :first_name}
    it {should validate_presence_of :last_name}
    it {should validate_presence_of :email}
   end

  context 'accessibility' do 
    it {should allow_mass_assignment_of :first_name}
    it {should allow_mass_assignment_of :last_name}
    it {should allow_mass_assignment_of :phone}
    it {should allow_mass_assignment_of :email}
    it {should allow_mass_assignment_of :address}
    it {should allow_mass_assignment_of :city}
    it {should allow_mass_assignment_of :state}
    it {should allow_mass_assignment_of :zip_code}    
    it {should allow_mass_assignment_of :user_id}


  end

  context 'asscociations' do
    it {should belong_to :user}
  end

end
