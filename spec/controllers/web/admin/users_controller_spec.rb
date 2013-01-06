require 'spec_helper'

describe Web::Admin::UsersController do

  before do
    @user = create(:user)
    sign_in @user
    @default_params = {
      :email => 'test_user@test.com',
      :password => '12345'
    }
  end

  it 'should get :index' do
    get :index
    expect(response).to be_success
  end

  it 'should get :new' do
    get :new
    expect(response).to be_success
  end

  it 'should post :create' do
    post :create, :user => @default_params
    expect(response).to be_success
    user = User.find_by_email(@default_params[:email])
    user.should_not be_nil
  end

  it 'should put :update' do
    put :update, :id => @user.id, :user => @default_params
    user = User.find(@user)
    user.email.should == @default_params[:email]
    expect(response).to be_success
  end

  it 'should delete :destroy' do
    delete :destroy, :id => @user.id
    expect(response).to be_redirect
    User.exists?(@user).should be_false
  end
end
