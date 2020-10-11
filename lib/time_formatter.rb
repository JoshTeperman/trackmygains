module TimeFormatter
  class << self
    def in_hours_minutes_seconds(total_seconds)
      [total_seconds / 3600, total_seconds / 60 % 60, total_seconds % 60].map { |t| t.to_s.rjust(2, '0')}.join(':')
    end
  end
end
