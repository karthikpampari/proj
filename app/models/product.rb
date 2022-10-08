class Product < ApplicationRecord
  has_and_belongs_to_many :users


  belongs_to :warehouse,optional: true 
  before_update :save_warehouse
  def save_warehouse
    puts "========="
    self.warehouse.save
  end 
end
