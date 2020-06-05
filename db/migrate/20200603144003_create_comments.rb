class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :citizen_id
      t.integer :police_department_id
      t.string :description
      t.date :date

      t.timestamps
    end
  end
end
