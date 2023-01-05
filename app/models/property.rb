class Property < ApplicationRecord
    validates :name, :price, :age, :address, presence: true
end
