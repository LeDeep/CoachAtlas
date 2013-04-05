require 'spec_helper'

describe SessionsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  context "POST create" do

    context 'with valid parameters' do
      it 'should set the session to the user id' do 
        user = FactoryGirl.create(:user)
        post :create, {
                        :provider => 'facebook',
                        :uid => '1234567',
                        :info => {
                          :nickname => 'jbloggs',
                          :email => 'joe@bloggs.com',
                          :name => 'Joe Bloggs',
                          :first_name => 'Joe',
                          :last_name => 'Bloggs',
                          :image => 'http://graph.facebook.com/1234567/picture?type=square',
                          :urls => { :Facebook => 'http://www.facebook.com/jbloggs' },
                          :location => 'Palo Alto, California',
                          :verified => true
                        }
        should set_session(:user_id).to(user.id)
      end
    end

    context 'with invalid parameters' do
      let(:user) {FactoryGirl.create(:user)}

      before {post :create, {:email => user.email, :password => '1sze'}}
      it {should_not set_session(:user_id)}
    end
  end

  context "DELETE destroy" do
    it {should_not set_session(:user_id)}
  end

end