class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_and_belongs_to_many :products
  enum role: [:customer,:manufacture]
  after_initialize :set_default_role,:if => :new_record?
  def set_default_role
    self.role ||=:user
  end 
end
