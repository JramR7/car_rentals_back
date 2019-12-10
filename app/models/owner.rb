class Owner < ApplicationRecord
  belongs_to :user
  has_many :car
  has_many :contract

  validates :licence,
                allow_blank: false,
                uniqueness: true,
                length: { minimum: 7 }
end
