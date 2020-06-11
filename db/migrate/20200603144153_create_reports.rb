class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.integer :police_id
      t.integer :citizen_id
      t.string :location
      t.string :city
      t.string :state
      t.date :date
      t.time :time
      t.boolean :arrest
      t.boolean :force_used
      t.text :reason
      t.text :incident_description
      t.text :resolution

      t.timestamps
    end
  end
end
