require 'spec_helper'

describe Web::Admin::DashboardController do
  before do
    @user = create :user
    sign_in @user
  end

  it 'should get index' do
    get :index
    expect(response).to be_success
  end

end
