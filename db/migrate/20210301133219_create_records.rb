class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.integer :area_id, null: false
      t.text :text
      t.timestamps
    end
  end
end
