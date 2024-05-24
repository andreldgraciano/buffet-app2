class Buffet < ApplicationRecord
  belongs_to :buffet_profile
  has_and_belongs_to_many :payments

  validates :brand_name, :corporation_name, :cnpj, :phone, :email, :address, :district, :state, :city, :cep, presence: true
  validates :buffet_profile_id, uniqueness: true

  def full_information
    "#{corporation_name} | #{cnpj}"
  end

  def full_address
    "#{address} - #{district} - #{city} - #{state} - #{cep} "
  end
end
