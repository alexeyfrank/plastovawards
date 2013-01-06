require 'spec_helper'

describe SessionsController do
  before do
    @user = create(:user)
  end

  it 'should get new' do
    get :new
    expect(response).to be_success
  end

  it 'should post create' do
    post :create, :user => @user
    expect(response).to be_redirect
    current_user.email.should == @user.email
  end

  it 'should delete destroy' do
    delete :destroy
    current_user.should be_nil
  end

end
