class AddPasswordDigestToPolice < ActiveRecord::Migration[6.0]
  def change
    add_column :police, :password_digest, :string
  end
end
