class Web::MembersController < Web::ApplicationController
  def new
    header_img :default
    @member = Member.new
    @member.pictures.build
  end

  def create
    header_img :default
  end
end
