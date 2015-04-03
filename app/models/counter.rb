class Counter < ActiveRecord::Base

  #include Validatable

  belongs_to :tariff

  validates :hot_water, presence: true, numericality: true
  validates :cold_water, presence: true, numericality: true
  validates :electricity, presence: true, numericality: true
  validates :date, presence: true
  validates :gas, presence: true, numericality: true
  validates :heat, presence: true, numericality: true
  validates :phone, presence: true, numericality: true
  validates :cleaning, presence: true, numericality: true
  validates :speaker, presence: true, numericality: true

  scope :by_year, lambda { |year| where('extract(year from date) = ?', year) }

  def get_total_sum(**vals)
    sum = 0.0
    vals.each do |k,v|
      sum += v
    end
    sum += phone
    sum += heat
    sum += cleaning
    sum += speaker
    return sum
  end

  def get_calculated
    results = {
      :hot_water => 0.0,
      :cold_water => 0.0,
      :electricity => 0.0,
      :gas => 0.0,
      :hot_water_sink => 0.0
    }
    if Counter.first.id != id
      prev = Counter.where('id < ?', id).last
      tariff = Tariff.find(tariff_id)
      results[:hot_water] = (hot_water - prev.hot_water) * tariff.hot_water
      results[:cold_water] = (cold_water - prev.cold_water) * tariff.cold_water
      results[:gas] = (gas - prev.gas) * tariff.gas
      results[:electricity] = (electricity - prev.electricity) * tariff.electricity
      results[:hot_water_sink] = results[:hot_water] * tariff.hot_water_sink
    end
    return results
  end
end
