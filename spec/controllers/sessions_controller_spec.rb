require 'spec_helper'

describe SessionsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end



  context "POST create" do
    before do
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
    end

    it "sets a session variable to the OmniAuth auth hash" do
      request.env["omniauth.auth"][:uid].should == '1234'
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