Honeybadger.configure do |config|
  config.before_notify do |notice|
    notice.halt! if notice.error_message =~ /sensitive data/

    # Avoid using all your quota for non-production errors by allowing
    # only 10 errors to be sent per minute
    notice.halt! if !Rails.env.production? && Redis.current.incr(key = "honeybadger_errors:#{(Time.now - Time.now.sec).to_i}") > 10
    Redis.current.expire(key, 120)
  end

  # config.before_event do |event|
  #   # DB-backed job backends can generate a lot of noisy queries
  #   if event.event_type == "sql.active_record" && event[:query]&.match?(/good_job|solid_queue/)
  #     event.halt!
  #   end
  #
  #   # Truncate long queries
  #   if event.event_type == "sql.active_record" && event[:query].present?
  #     event[:query] = event[:query].first(256)
  #   end
  #
  #   # Set some data for each event
  #   if environment = ENV["HONEYBADGER_ENV"] || Rails.env
  #     event[:environment] = environment
  #   end
  #
  #   # See https://api.rubyonrails.org/classes/ActiveSupport/CurrentAttributes.html for more info about using Current
  #   event[:user] = { id: Current.user.id, email: Current.user.email } if Current.user
  #
  #   # Avoid using all your quota for non-production events by allowing
  #   # only 10 events to be sent per minute
  #   event.halt! if !Rails.env.production? && Redis.current.incr(key = "honeybadger_event:#{(Time.now - Time.now.sec).to_i}") > 10
  #     Redis.current.expire(key, 120)
  # end
end
