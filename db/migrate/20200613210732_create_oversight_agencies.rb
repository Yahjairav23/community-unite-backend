class CreateOversightAgencies < ActiveRecord::Migration[6.0]
  def change
    create_table :oversight_agencies do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :phone_number
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
