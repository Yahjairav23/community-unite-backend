class CitizenSerializer < ActiveModel::Serializer
  attributes :id, :password_digest, :name, :address, :city, :state, :phone_number, :email, :birthday, :gender, :race, :state_id

  has_many :comments
  has_many :police_departments, through: :comments

  has_many :reports
  has_many :police, through: :reports


end
