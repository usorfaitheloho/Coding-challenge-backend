class User < ApplicationRecord
    has_many :sectors, foreign_key: 'sector_id'

    validates :name, presence: true, length: { maximum: 30}
end
