# Create nationalities table migration
class CreateNationalities < ActiveRecord::Migration[5.1]
  def change
    create_table :nationalities do |t|
      t.string :name, unique: true

      t.timestamps
    end
  end
end
