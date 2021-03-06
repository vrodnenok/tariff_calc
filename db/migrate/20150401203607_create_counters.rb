class CreateCounters < ActiveRecord::Migration
  def change
    create_table :counters do |t|
      t.date :date
      t.float :gas
      t.float :cold_water
      t.float :hot_water
      t.float :electricity
      t.float :heat
      t.float :phone
      t.float :cleaning
      t.float :speaker
      t.string :comment
      t.belongs_to :tariff
      t.references :tariff, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
