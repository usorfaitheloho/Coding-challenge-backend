class Sector < ApplicationRecord
    belongs_to :user, class_name: 'User'

    validates_presence_of :user
    validates :name, presence: true, length: {maximum: 30 }
end
