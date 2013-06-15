class SessionsController < ApplicationController
  #NOTE: I don't understand yet
  protect_from_forgery with: :null_session

  def create
  end
end
