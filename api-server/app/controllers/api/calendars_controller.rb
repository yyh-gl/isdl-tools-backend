class Api::CalendarsController < ApplicationController

  # GET /api/google/calendars
  def index
    events = fetch_calender_events
    json_response(events)
  end

  # GET /api/google/calendars/:event_title
  # TODO: 日本語対応
  def search
    events = fetch_event_with_title(params['event_title'])
    if events.nil?
      json_response(events, :no_content)
      return
    end
    json_response(events)
  end

  swagger_controller :Calendars, 'GoogleカレンダーAPI'

  swagger_api :index do
    summary 'Get events in Google Calendar'
    consumes ['application/json']
    response :ok, 'Success', :Event
    response :not_found
    response :internal_server_error
  end

  swagger_model :Event do
    description 'Event parameters'
    property :created, :string, :required, '2018-03-21T07:31:25.000+00:00'
    property :creator, :object, :required, 'Creator object', { "$ref": 'Creator' }
    property :end, :object, :required, 'End object', { "$ref": 'End' }
    property :etag, :string, :required, '\"3043234983264000\"'
    property :html_link, :string, :required, 'https://www.google.com/calendar/event?eid=MjVramFnbmJuOTkzcTVzYWNzNjE5OHNrc2kgbW1pa2lAbWlraWxhYi5kb3NoaXNoYS5hYy5qcA'
    property :i_cal_uid, :string, :required, '25kjagnbn993q5sacs6198sksi@google.com'
    property :id, :string, :required, '25kjagnbn993q5sacs6198sksi'
    property :kind, :string, :required, 'calendar#event'
    property :organizer, :object, :required, 'Organizer object', { "$ref": 'Organizer' }
    property :reminders, :object, :required, 'Reminders object', { "$ref": 'Reminders' }
    property :sequence, :integer, :required, 0
    property :start, :object, :required, 'Start object', { "$ref": 'Start' }
    property :status, :string, :required, 'confirmed'
    property :summary, :string, :required, '父母懇談会'
    property :updated, :string, :required, '2018-03-21T07:31:31.632+00:00'
  end

  swagger_model :Creator do
    description 'Creator parameters'
    property :email, :string, :required, 'test@example.com'
    property :self, :string, :required, 'true'
  end

  swagger_model :Start do
    description 'Start parameters'
    property :date_time, :string, :required, '2018-05-26T14:00:00.000+09:00'
  end

  swagger_model :End do
    description 'End parameters'
    property :date_time, :string, :required, '2018-05-26T16:30:00.000+09:00'
  end

  swagger_model :Organizer do
    description 'Organizer parameters'
    property :email, :string, :required, 'test@example.com'
    property :self, :string, :required, 'true'
  end

  swagger_model :Reminders do
    description 'Reminders parameters'
    property :use_default, :string, :required, 'true'
  end

end
