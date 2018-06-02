class ApplicationController < ActionController::API
  require 'open-uri'
  require 'net/http'
  require 'json'
  include Response
  include ExceptionHandler
  include GoogleCalendar
end
