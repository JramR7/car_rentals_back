class Contract < ApplicationRecord
  belongs_to :car
  belongs_to :rental_user
  belongs_to :trip
  belongs_to :company
end
