class SessionsController < ApplicationController
  def success
    redirect_to '/forums'
  end
end
