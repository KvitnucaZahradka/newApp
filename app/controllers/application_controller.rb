class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  add_flash_types :success, :warning, :danger, :info
 # I had :null_session, hartl had: :exception, in the "protect_from_forgery with:"
end
