class JwtAllowlistedjwt < ApplicationRecord
    include Devise::JWT::RevocationStrategies::Allowlist
    self.table_name = 'jwt_allowlists'
end
