require 'spec_helper'

describe ProfilesController do
 let(:profile) {Profile.create({:gender => 'tbd', :sport => 'futbol', :working_zip_code => '95811', :bio => 'i coach soccer', :user_id => 1})}
 let(:user) {User.create({:email => 'whatever@email.com', :status => 1, :password => 'reallgreat231212', :password_confirmation => 'reallgreat231212'})}


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

      let(:user) {FactoryGirl.create(:user)}
      let(:profile) {FactoryGirl.create(:profile)}
      let(:valid_attributes) {{:user_id => user.id, :profile => {:gender => 'tbd', :sport => 'futbol', :working_zip_code => '95811', :bio => 'i coach soccer', :user_id => 1}}}

      it 'creates a new profile' do
        expect {post :create, valid_attributes}.to change(Profile, :count).by(1)
      end

      before {post :create, valid_attributes}

      # it {should redirect_to profile_path(profile)}
      it {should set_the_flash[:notice].to("Your profile has been created.")}
    end
  end

  context 'GET index' do 
    before {get :index}

    it {should render_template :index}
  end

  context 'GET show' do 
    
     let(:valid_attributes) {{:gender => 'tbd', :sport => 'futbol', :working_zip_code => '95811', :bio => 'i coach soccer', :user_id => 1}}
     let(:valid_parameters) {{:profile => valid_attributes}}

     before {get :show, {:id => profile.id}}

     it {should render_template :show}
  end

  context 'GET edit' do
    let(:profile) {FactoryGirl.create :profile}
    before {get :edit, :id => profile.id}

    it {should render_template :edit}
  end

  context 'PUT update' do
    let(:profile) {FactoryGirl.create :profile}

    context 'with valid parameters' do
      let(:valid_attributes) {{:gender => 'tbd', :sport => 'tennis', :working_zip_code => 'Sacramento, CA', :bio => 'i coach soccer', :user_id => 1}}
      let(:valid_parameters) {{:id => profile.id, :profile => valid_attributes}}

      before {put :update, valid_parameters}

      it 'updates the profile' do
        Profile.find(profile.id).sport.should eq valid_attributes[:sport]
      end

 #     it {should redirect_to profile_path(profile)}
      it {should set_the_flash[:notice]}
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) {{:working_zip_code => ''}}
      let(:invalid_parameters) {{:id => profile.id, :profile => invalid_attributes}}

      before {put :update, invalid_parameters}

      it {should render_template :edit}
      it {should set_the_flash[:alert]}
    end
  end

  context 'DELETE destroy' do
    it 'deletes a profile' do
      profile = FactoryGirl.create :profile
      expect {delete :destroy, {:id => profile.id}}.to change(Profile, :count).by(-1)
    end

    let(:profile) {FactoryGirl.create :profile}
    before {delete :destroy, {:id => profile.id}}

    it {should redirect_to profiles_path}
    it {should set_the_flash[:notice]}
  end
end