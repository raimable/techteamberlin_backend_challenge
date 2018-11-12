class CreatePayloads < ActiveRecord::Migration[5.1]
  def change
    create_table :payloads do |t|
      t.references :mission, foreign_key: true
      t.references :nationality, foreign_key: true, null:true
      t.string :payload_identifier
      t.boolean :reused
      t.string :manufacturer
      t.string :payload_type
      t.float :mass_kg
      t.float :mass_lbs
      t.string :orbit

      t.timestamps
    end
  end
end
