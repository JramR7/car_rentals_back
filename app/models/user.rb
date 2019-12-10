class User < ApplicationRecord 
    has_one :owner
    has_one :rental_user

    # address validation
    validates :address,
                length: { minimum: 5 }

    # phone validation
    validates :phone,
                uniqueness: true,
                numericality: true,
                length: { minimum: 7 }

    validates :id_document,
                allow_blank: true,
                uniqueness: true,
                length: { minimum: 7 }
end
