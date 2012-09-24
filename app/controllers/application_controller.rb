class ApplicationController < ActionController::Base
  include OmniauthSingleSignon::ApplicationHelper

  def forem_user
    current_user
  end

  def authenticate
    unless current_user
      redirect_to '/auth/single_signon'
    else
      true
    end
  end

  helper_method :forem_user
  helper OmniauthSingleSignon::ApplicationHelper

  protect_from_forgery
end
