json.array!(@counters) do |counter|
  json.extract! counter, :id, :gas, :cold_water, :hot_water, :electro, :comment, :belongs_to, :tariff_id
  json.url counter_url(counter, format: :json)
end
