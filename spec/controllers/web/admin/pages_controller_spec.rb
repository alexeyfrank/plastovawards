require 'spec_helper'

describe Web::Admin::PagesController do

  before do
    @user = create :user
    @test_page = create :page, author: @user
    sign_in @user
  end

  it "should get index" do
    get :index
    response.should be_success
  end

  it "should get new" do
    get :new
    response.should be_success
  end

  it "should post create" do
    params = { title: 'Post Title', content: 'Post content' }
    post :create, page: params
    response.should be_redirect
    page = Page.find_by_title(params[:title])
    page.should_not be_nil
    page.content.should == params[:content]
  end

  it "should get edit" do
    get :edit, :id => @test_page.id
    response.should be_success
  end

  it "should put update" do
    params =  { title: "New Title" }
    put :update, id: @test_page.id, page: params
    response.should be_success
    page = Page.find_by_title params[:title]
    page.should_not be_nil
  end

  it "should delete destroy" do
    delete :destroy, id: @test_page.id
    response.should be_redirect
    Page.exists?(@test_page.id).should be_false
  end

end
