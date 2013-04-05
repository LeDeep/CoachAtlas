require 'spec_helper'

describe SessionsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  context 'session authorizations' do 
    before do
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
    end
    
    it "sets a session variable to the OmniAuth auth hash" do
      request.env["omniauth.auth"][:uid].should == '1234'
    end
  end


    context 'with invalid parameters' do
      before do 
        request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
      end
      
      it 'should fail to find the user' do 
        request.env["omniauth.auth"][:email].should_not == ''
      end
     
      it {should redirect_to root_url}
      it {should set_the_flash[:alert]}
    end

  context "POST create" do
   #  context 'with valid parameters' do
   #    it 'should set the session to the user id' do 
   #      user = FactoryGirl.create(:user)
   #      post :create, {:email => user.email, :password => user.password}
   #      should set_session(:user_id).to(user.id)
   #   end
   # end

   #  context 'with invalid parameters' do
   #    let(:user) {FactoryGirl.create(:user)}

   #    before {post :create, {:email => user.email, :password => '1sze'}}
   #    it {should_not set_session(:user_id)}
   #  end
>>>>>>> master
  end
  





  context "DELETE destroy" do
    it {should_not set_session(:user_id)}
  end
end