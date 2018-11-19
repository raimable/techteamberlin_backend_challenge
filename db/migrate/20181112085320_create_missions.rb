# Create mission table migration
class CreateMissions < ActiveRecord::Migration[5.1]
  def change
    create_table :missions do |t|
      t.string :name
      t.string :mission_identifier, unique: true, null: false
      t.string :wikipedia
      t.string :website
      t.string :twitter
      t.text :description

      t.timestamps
    end
  end
end
