require 'spec_helper'

describe JobsController do 


  let(:valid_attributes) {{:listing_title => 'Soccer Coach - Girls U15', :city => 'Sacramento', :state => 'CA', :gender => 'tbd', :sport => 'futbol', :zip_code => '95811', :description => 'i coach soccer', :user_id => 1}}
  let(:valid_parameters) {{:job => valid_attributes}}
 

  let(:invalid_attributes) {{:city => 'Sacramento', :state => 'CA', :gender => 'tbd', :sport => 'futbol', :zip_code => '95811', :description => 'i coach soccer', :user_id => 1}}
  let(:invalid_parameters) {{:job => invalid_attributes}}
 
  let(:job) {Job.create({:listing_title => 'Soccer Coach - Girls U15', :city => 'Sacramento', :state => 'CA', :gender => 'tbd', :sport => 'futbol', :zip_code => '95811', :description => 'i coach soccer', :user_id => 1})}

  context 'routes' do
    it {should route(:get, '/jobs/new').to :action => :new}
    it {should route(:post, '/jobs').to :action => :create}
    it {should route(:get, '/jobs/1').to :action => :show, :id => 1}
    it {should route(:get, '/jobs').to :action => :index}
    it {should route(:get, '/jobs/1/edit').to :action => :edit, :id => 1}
    it {should route(:delete, '/jobs/1').to :action => :destroy, :id => 1}
  end

  context 'GET new' do 
    before {get :new}
    it {should render_template :new}
  end

  context 'POST create' do 

    context 'with valid parameters' do 

      it 'creates a new job' do
        expect {post :create, valid_parameters}.to change(Job, :count).by(1)
      end

      before {post :create, valid_parameters}

      it {should redirect_to jobs_path}
      it {should set_the_flash[:notice].to("Your job has been created.")}
    end
  end

  context 'GET index' do 
    before {get :index}

    it {should render_template :index}
    
    before {get :index}

    it {should render_template :index}
  end

  context 'GET show' do 
     before {get :show, {:id => job.id}}

     it {should render_template :show}
  end

  context 'GET edit' do
    let(:job) {FactoryGirl.create :job}
    before {get :edit, :id => job.id}

    it {should render_template :edit}
  end

  context 'PUT update' do
    let(:job) {FactoryGirl.create :job}

    context 'with valid parameters' do
      let(:valid_attributes) {{:listing_title => 'Soccer Coach - Girls U15', :city => 'Sacramento', :state => 'CA', :gender => 'tbd', :sport => 'soccer', :zip_code => '95811', :description => 'i coach soccer', :user_id => 1}}
      let(:valid_parameters) {{:id => job.id, :job => valid_attributes}}

      before {put :update, valid_parameters}

      it 'updates the job' do
        Job.find(job.id).sport.should eq valid_attributes[:sport]
      end

      it {should redirect_to jobs_path}
      it {should set_the_flash[:notice]}
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) {{:zip_code => ''}}
      let(:invalid_parameters) {{:id => job.id, :job => invalid_attributes}}

      before {put :update, invalid_parameters}

      it {should render_template :edit}
      it {should set_the_flash[:alert]}
    end
  end

  context 'DELETE destroy' do
    it 'deletes a job' do
      job = FactoryGirl.create :job
      expect {delete :destroy, {:id => job.id}}.to change(Job, :count).by(-1)
    end

    let(:job) {FactoryGirl.create :job}
    before {delete :destroy, {:id => job.id}}

    it {should redirect_to jobs_path}
    it {should set_the_flash[:notice]}
  end


end