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

  context 'search scopes' do 
    it 'searches by sport' do 
      job1 = Job.create!(:sport => 'soccer', :zip_code => '34565', :listing_title => 'soccer training', :gender => 'female', :city => 'atlanta', :state => 'GA', :description => 'soccer training for free', :user_id => 1 )
      job2 = Job.create!(:sport => 'basketball', :zip_code => '34565', :listing_title => 'soccer training', :gender => 'female', :city => 'atlanta', :state => 'GA', :description => 'soccer training for free', :user_id => 1 )
      search = {:sport => 'soccer'}
      Job.sport('soccer').should eq [job1]
    end

    it 'searches by zip code' do 
      job1 = Job.create!(:sport => 'soccer', :zip_code => '34565', :listing_title => 'soccer training', :gender => 'female', :city => 'atlanta', :state => 'GA', :description => 'soccer training for free', :user_id => 1 )
      job2 = Job.create!(:sport => 'basketball', :zip_code => '31145', :listing_title => 'soccer training', :gender => 'female', :city => 'atlanta', :state => 'GA', :description => 'soccer training for free', :user_id => 1 )
      Job.zip_code('34565').should eq [job1]
    end

    it 'searches by sport and zip code' do 
      job1 = Job.create!(:sport => 'soccer', :zip_code => '34565', :listing_title => 'soccer training', :gender => 'female', :city => 'atlanta', :state => 'GA', :description => 'soccer training for free', :user_id => 1 )
      job2 = Job.create!(:sport => 'soccer', :zip_code => '32554', :listing_title => 'soccer training', :gender => 'female', :city => 'atlanta', :state => 'GA', :description => 'soccer training for free', :user_id => 1 )
      job3 = Job.create!(:sport => 'basketball', :zip_code => '34565', :listing_title => 'soccer training', :gender => 'female', :city => 'atlanta', :state => 'GA', :description => 'soccer training for free', :user_id => 1 )
      Job.sport('soccer').zip_code('34565').should eq [job1]
    end
  end


end
