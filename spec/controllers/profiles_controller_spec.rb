require 'spec_helper'

describe ProfilesController do
 
  context 'routes' do
    it {should route(:get, '/profiles/new').to :action => :new}
    it {should route(:post, '/profiles').to :action => :create}
    it {should route(:get, '/profiles/1').to :action => :show, :id => 1}
    it {should route(:get, '/profiles').to :action => :index}
    it {should route(:get, '/profiles/1/edit').to :action => :edit, :id => 1}
    it {should route(:delete, '/profiles/1').to :action => :destroy, :id => 1}
  end

  context 'GET new' do 
    before {get :new}
    it {should render_template :new}
  end

  context 'POST create' do 

    context 'with valid parameters' do 
      let(:valid_attributes) {{:first_name => 'Peter', :last_name => 'Lowry', :gender => 'tbd', :sport => 'futbol', :location => 'Sacramento, CA', :contact_email => 'pete@coachatlas.com', :bio => 'i coach soccer', :user_id => 1}}
      let(:valid_parameters) {{:profile => valid_attributes}}

      before {post :create, valid_parameters}

      it {should redirect_to new_profile_path}
      it {should set_the_flash[:notice].to("Thank you for signing up with Coach Atlas. Your account has been created.")}
    end
  end

end