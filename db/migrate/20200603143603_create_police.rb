class CreatePolice < ActiveRecord::Migration[6.0]
  def change
    create_table :police do |t|
      t.integer :badge_number
      t.string :name
      t.string :job_title
      t.integer :police_department_id
      t.string :gender

      t.timestamps
    end
  end
end
