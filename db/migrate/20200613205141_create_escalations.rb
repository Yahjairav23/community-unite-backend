class CreateEscalations < ActiveRecord::Migration[6.0]
  def change
    create_table :escalations do |t|
      t.integer :report_id
      t.date :date
      t.string :reason
      t.string :status, default: 'active'

      t.timestamps
    end
  end
end
