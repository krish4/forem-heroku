module Authenticate
  include OmniauthSingleSignon::ApplicationHelper
  def authenticate
    unless current_user
      redirect_to '/auth/developer'
    else
      true
    end
  end
end
