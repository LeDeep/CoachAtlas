require 'spec_helper'

describe IdentitiesController do
  it "returns http success" do
    get 'new'
    response.should be_success
  end
end
