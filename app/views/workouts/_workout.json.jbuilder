json.extract! workout, :id, :start_time, :finish_time, :state, :created_at, :updated_at
json.url workout_url(workout, format: :json)
