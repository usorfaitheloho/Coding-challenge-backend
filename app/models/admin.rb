class Admin < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Allowlist

  devise :database_authenticatable,
         :registerable, :validatable

  validates_presence_of :email
end
