class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.citext  :name
      t.citext  :description
      t.decimal :unit_price
      t.integer :merchant_id

      t.timestamps nul: false
    end
  end
end
