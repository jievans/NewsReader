class ApplicationController < ActionController::Base
  protect_from_forgery

  include SessionsHelper

  before_filter :require_logged_in
end
