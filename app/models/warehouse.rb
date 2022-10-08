class Warehouse < ApplicationRecord
    has_many :products  

    before_save :quantity_set 
    def quantity_set
        self.quantity=self.products.count
    end 
end
