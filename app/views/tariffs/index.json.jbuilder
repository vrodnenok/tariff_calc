json.array!(@tariffs) do |tariff|
  json.extract! tariff, :id, :gas, :cold_water, :hot_water, :electro, :comment
  json.url tariff_url(tariff, format: :json)
end
