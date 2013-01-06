require 'spec_helper'

describe Web::SessionsController do
  before do
    @user = create(:user)
    @params = { :email => @user.email, :password => '12345' }
  end

  it 'should get new' do
    get :new
    expect(response).to be_success
  end

  it 'should post create' do
    post :create, :user => @params
    expect(response).to be_redirect
    signed_in?.should be_true
    current_user.email.should == @user.email
  end

  it 'should delete destroy' do
    delete :destroy
    expect(response).to be_redirect
    signed_in?.should be_false
    current_user.should be_nil
  end

end
