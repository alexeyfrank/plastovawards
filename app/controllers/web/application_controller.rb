class Web::ApplicationController < ApplicationController
  include Web::AuthHelper

  helper_method :current_user, :signed_in?
end
