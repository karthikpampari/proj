class Cart < ApplicationRecord
  before_save :create_total
  def create_total
    puts "-------------------------"
    self.total =self.quantity * self.price
  end 

end
