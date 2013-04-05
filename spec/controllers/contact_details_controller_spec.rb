require 'spec_helper'

describe ContactDetailsController do 


  let(:valid_parameters) {{:contact_detail => valid_attributes}}
  let(:valid_attributes) {{:first_name => 'Peter', :last_name => 'Lowry', :email => 'peter@coachatlas.com', :phone => '9164554554', :address => '111 main street', :city => 'Sacramento', :state => 'CA', :zip_code => '95811', :user_id => 1}}
 

  let(:invalid_attributes) {{:last_name => 'Lowry', :email => 'peter@coachatlas.com', :phone => '9164554554', :address => '111 main street', :city => 'Sacramento', :state => 'CA', :zip_code => '95811', :user_id => 1}}
  let(:invalid_parameters) {{:contact_detail => invalid_attributes}}
 
  let(:contact_detail) {ContactDetail.create({:first_name => 'Peter', :last_name => 'Lowry', :email => 'peter@coachatlas.com', :phone => '9164554554', :address => '111 main street', :city => 'Sacramento', :state => 'CA', :zip_code => '95811', :user_id => 1})}

  context 'routes' do
    it {should route(:get, '/contact_details/new').to :action => :new}
    it {should route(:post, '/contact_details').to :action => :create}
    it {should route(:get, '/contact_details/1/edit').to :action => :edit, :id => 1}
    it {should route(:get, '/contact_details/1').to :action => :show, :id => 1}
  end

  context 'GET new' do 
    before {get :new}
    it {should render_template :new}
  end

  context 'POST create' do 

    context 'with valid parameters' do 
      let(:contact_detail) {ContactDetail.create({:first_name => 'Peter', :last_name => 'Lowry', :email => 'peter@coachatlas.com', :phone => '9164554554', :address => '111 main street', :city => 'Sacramento', :state => 'CA', :zip_code => '95811', :user_id => 1})}

      it 'creates a new contact_detail' do
        expect {post :create, valid_parameters}.to change(ContactDetail, :count).by(1)
      end

      before {post :create, valid_parameters}

     # someone else do test below
      # it {should redirect_to contact_detail_path(contact_detail)}
      it {should set_the_flash[:notice].to("Your contact information has been created.")}
    end
  end

  context 'GET edit' do
    let(:contact_detail) {FactoryGirl.create :contact_detail}
    before {get :edit, :id => contact_detail.id}

    it {should render_template :edit}
  end

  context 'GET show' do 
     before {get :show, {:id => contact_detail.id}}

     it {should render_template :show}
  end

  context 'PUT update' do
    let(:contact_detail) {FactoryGirl.create :contact_detail}

    context 'with valid parameters' do
      let(:valid_attributes) {{:first_name => 'Peter', :last_name => 'Piper', :email => 'peter@coachatlas.com', :phone => '9164554554', :address => '111 main street', :city => 'Sacramento', :state => 'CA', :zip_code => '95811', :user_id => 1}}
      let(:valid_parameters) {{:id => contact_detail.id, :contact_detail => valid_attributes}}

      before {put :update, valid_parameters}

      it 'updates the contact_detail' do
        ContactDetail.find(contact_detail.id).last_name.should eq valid_attributes[:last_name]
      end

      it {should redirect_to contact_detail_path(contact_detail)}
      it {should set_the_flash[:notice]}
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) {{:last_name => ''}}
      let(:invalid_parameters) {{:id => contact_detail.id, :contact_detail => invalid_attributes}}

      before {put :update, invalid_parameters}

      it {should render_template :edit}
      it {should set_the_flash[:alert]}
    end
 end

end 
# require 'spec_helper'

# describe ContactDetailsController do 


#   let(:valid_parameters) {{:contact_detail => valid_attributes}}
#   let(:valid_attributes) {{:first_name => 'Peter', :last_name => 'Lowry', :email => 'peter@coachatlas.com', :phone => '9164554554', :address => '111 main street', :city => 'Sacramento', :state => 'CA', :zip_code => '95811', :user_id => 1}}
 

#   let(:invalid_attributes) {{:last_name => 'Lowry', :email => 'peter@coachatlas.com', :phone => '9164554554', :address => '111 main street', :city => 'Sacramento', :state => 'CA', :zip_code => '95811', :user_id => 1}}
#   let(:invalid_parameters) {{:contact_detail => invalid_attributes}}
 
#   let(:contact_detail) {ContactDetail.create({:first_name => 'Peter', :last_name => 'Lowry', :email => 'peter@coachatlas.com'})}

#   context 'routes' do
#     it {should route(:get, '/contact_details/new').to :action => :new}
#     it {should route(:post, '/contact_details').to :action => :create}
#     it {should route(:get, '/contact_details/1/edit').to :action => :edit, :id => 1}
#     it {should route(:get, '/contact_details/1').to :action => :show, :id => 1}
#   end

#   context 'GET new' do 
#     before {get :new}
#     it {should render_template :new}
#   end

#   context 'POST create' do 

#     context 'with valid parameters' do 
#       # let(:contact_detail) {FactoryGirl.create :contact_detail}
#       it 'creates a new contact_detail' do
#         expect {post :create, valid_parameters}.to change(ContactDetail, :count).by(1)
#       end

#       # let(:contact_detail) {FactoryGirl.create :contact_detail}
#       # it 'creates an instance of contact_detail with params' do 
#         # 
        


#         it {should set_the_flash[:notice].to("Your contact information has been created.")}

#         it 'redirects to the contact detail' do
#           binding.pry
#           peter = ContactDetail.stub(:new).and_return(ContactDetail.create({:first_name => 'Peter', :last_name => 'Lowry', :email => 'peter@coachatlas.com'}))
#           post :create, valid_parameters
#           should redirect_to contact_detail_path(peter)
#         end
#       # end
#     end
#   end

#   context 'GET edit' do
#     let(:contact_detail) {FactoryGirl.create :contact_detail}
#     before {get :edit, :id => contact_detail.id}

#     it {should render_template :edit}
#   end

#   context 'GET show' do 
#      before {get :show, {:id => contact_detail.id}}

#      it {should render_template :show}
#   end

#   context 'PUT update' do
#     let(:contact_detail) {FactoryGirl.create :contact_detail}

#     context 'with valid parameters' do
#       let(:valid_attributes) {{:first_name => 'Peter', :last_name => 'Piper', :email => 'peter@coachatlas.com', :phone => '9164554554', :address => '111 main street', :city => 'Sacramento', :state => 'CA', :zip_code => '95811', :user_id => 1}}
#       let(:valid_parameters) {{:id => contact_detail.id, :contact_detail => valid_attributes}}

#       before {put :update, valid_parameters}

#       it 'updates the contact_detail' do
#         ContactDetail.find(contact_detail.id).last_name.should eq valid_attributes[:last_name]
#       end

#       it {should redirect_to contact_detail_path(contact_detail)}
#       it {should set_the_flash[:notice]}
#     end

#     context 'with invalid parameters' do
#       let(:invalid_attributes) {{:last_name => ''}}
#       let(:invalid_parameters) {{:id => contact_detail.id, :contact_detail => invalid_attributes}}

#       before {put :update, invalid_parameters}

#       it {should render_template :edit}
#       it {should set_the_flash[:alert]}
#     end
#  end

# end 

#    