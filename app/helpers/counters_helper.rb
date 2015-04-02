module CountersHelper

  def get_last_counter(id)
    last_counter = Counter.new()
    counters = Counter.last(2)
  end
end
