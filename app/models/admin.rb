class Admin < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Allowlist
  
  devise :database_authenticatable, :jwt_authenticatable,
          :registerable, :validatable,
          jwt_revocation_strategy: self

  validates_presence_of :email
end
