class Sector < ApplicationRecord
    validates :user_name, presence: true, length: { maximum: 30 }
    validates :sector_name, presence: true
    validates :agree, presence: true
end
