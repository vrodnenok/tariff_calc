class CreateTariffs < ActiveRecord::Migration
  def change
    create_table :tariffs do |t|
      t.float :gas
      t.float :cold_water
      t.float :hot_water
      t.float :hot_water_sink
      t.float :electricity
      t.string :comment
      t.date :tariff_started

      t.timestamps null: false
    end
  end
end
