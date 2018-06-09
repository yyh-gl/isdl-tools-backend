class ApplicationController < ActionController::API
  require 'open-uri'
  require 'net/http'
  require 'json'
  include Response
  include ExceptionHandler
  include GoogleCalendar

  DEFAULT_PARAMS = ['controller', 'action'].freeze
end
