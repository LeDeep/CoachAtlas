require 'spec_helper'

describe User do

  # context 'validations' do 
  #   it {should validate_uniqueness_of :email}
  #   it {should allow_value(" ").for(:email)}
  #   it {should allow_value(nil).for(:email)}
  # end

  context 'accessibility' do 
    it {should allow_mass_assignment_of :email}
    it {should allow_mass_assignment_of :password}
    it {should allow_mass_assignment_of :password_confirmation}
    it {should allow_mass_assignment_of :status}
  end

  context 'associations' do 
    it {should have_one :profile}
    it {should have_one :contact_detail}
    it {should have_many :jobs}
  end

end