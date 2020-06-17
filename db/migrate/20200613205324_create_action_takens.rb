class CreateActionTakens < ActiveRecord::Migration[6.0]
  def change
    create_table :action_takens do |t|
      t.date :date
      t.integer :escalation_id
      t.integer :oversight_agency_id
      t.string :description

      t.timestamps
    end
  end
end
