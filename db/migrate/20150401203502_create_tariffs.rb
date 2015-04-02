class CreateTariffs < ActiveRecord::Migration
  def change
    create_table :tariffs do |t|
      t.float :gas
      t.float :cold_water
      t.float :hot_water
      t.float :electro
      t.string :comment

      t.timestamps null: false
    end
  end
end
