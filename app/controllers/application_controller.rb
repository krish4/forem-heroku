class ApplicationController < ActionController::Base
  include OmniauthSingleSignon::ApplicationHelper

  def forem_user
    current_user
  end
  helper_method :forem_user
  helper OmniauthSingleSignon::ApplicationHelper

  protect_from_forgery
end
