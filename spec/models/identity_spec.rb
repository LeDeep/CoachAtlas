require 'spec_helper'

describe Identity do
  context 'accessibility' do
    it {should allow_mass_assignment_of :name}
    it {should allow_mass_assignment_of :email}
    it {should allow_mass_assignment_of :password}
    it {should allow_mass_assignment_of :password_confirmation}
  end
end
