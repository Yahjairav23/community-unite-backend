class CreateCitizens < ActiveRecord::Migration[6.0]
  def change
    create_table :citizens do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.integer :phone_number
      t.string :email
      t.date :birthday
      t.string :gender
      t.string :race
      t.string :state_id

      t.timestamps
    end
  end
end
