require 'spec_helper'

describe Checkin do
   it 'should return a formatted info window' do
       u = User.create! :name => 'lol', :email => 'lol@lol.lol', :password => 'lollol213@', :family => Family.create!(:name => 'aaa')
       p = u.posts.create! :text => 'haha'
       
       Checkin.new(:user => u, :post => p).gmaps4rails_infowindow.should eq ("<h4>lol</h4><br />haha")
   end
   
   it 'should find nearby places' do
      Checkin.new(latitude: 46.92749999999999, longitude: 26.370833).gmaps4rails_address.should include("Piatra Neam")
   end
   
   it 'should catch an exception' do
      Checkin.new.gmaps4rails_address.should eq("somewhere")
   end
end