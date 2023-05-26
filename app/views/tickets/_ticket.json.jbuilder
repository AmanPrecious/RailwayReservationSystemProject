json.extract! ticket, :id, :user_id, :train_id, :booking_status, :booking_date, :from_station, :to_station, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
