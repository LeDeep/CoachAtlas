require 'spec_helper'

describe UsersController do

  context 'routing' do
    it {should route(:get, '/signup').to :action => :new}    
    it {should route(:post, '/users').to :action => :create}
  end


  # context 'GET new' do
  #   before {get :new}

  #   it {should render_template :new}
  # end

  # context 'POST create' do 
  #   context 'with valid parameters' do
  #     let(:valid_attributes) {{:email => "plowry@scu.edu", :status => 10, :password => "abc1234", :password_confirmation => 'abc1234'}}
  #     let(:valid_parameters) {{:user => valid_attributes}}

  #     it 'creates a new user' do
  #       expect {post :create, valid_parameters}.to change(User, :count).by(1) 
  #     end
  #     context 'before create' do 
  #       before {post :create, valid_parameters}
  #       it {should redirect_to profiles_path}
  #       it {should set_the_flash[:notice]}
  #     end
  #   end 

  #   context 'with invalid parameters' do 
  #     let(:invalid_attributes) {{:email => "", :password => "abc1234", :password_confirmation => 'abc134'}}
  #     let(:invalid_parameters) {{:user => invalid_attributes}}

  #     context 'before create' do 
  #       before {post :create, invalid_parameters}
  #       it {should render_template :new}
  #     end
  #   end

  # end    
end