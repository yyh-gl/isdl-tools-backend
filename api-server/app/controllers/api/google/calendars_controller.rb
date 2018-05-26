class Api::Google::CalendarsController < ApplicationController

  def index
    events = fetch_calender_events
    json_response(events)
  end

  # TODO: 日本語対応
  def search
    events = fetch_event_with_title(params['event_title'])
    if events.nil?
      json_response(events, :no_content)
      return
    end
    json_response(events)
  end

end
