require 'spec_helper'

describe User do
  it 'should create a new user' do
    User.create! :name => 'lol', :email => 'lol@lol.lol', :password => 'lollol213@'
    User.find_by_name('lol').email.should eq 'lol@lol.lol'
  end
end
