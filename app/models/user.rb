class User < ApplicationRecord
    validates :name, presence: true, length: { maximum: 30}
    validates :sector_name, presence:true
    validates :agree
end
