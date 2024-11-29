class Category < ApplicationRecord
    validates :name, :description, {presence:true}
    validates :name, uniquess: true
end
