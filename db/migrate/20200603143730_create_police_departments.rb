class CreatePoliceDepartments < ActiveRecord::Migration[6.0]
  def change
    create_table :police_departments do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :phone_number
      t.string :email

      t.timestamps
    end
  end
end
