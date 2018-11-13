class AlterPayload < ActiveRecord::Migration[5.1]
 
  def up
    change_table :payloads do |t|
    	t.references :nationality, foreign_key: true, null:true
    end
  end

  def down
    
  end
end
