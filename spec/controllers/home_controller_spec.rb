require 'spec_helper'

describe HomeController do
  context 'routing' do 
     it {should route(:get, '/home/howitworks').to :action => :howitworks}
     it {should route(:get, '/home/aboutus').to :action => :aboutus}
  end
end