class User < ApplicationRecord
    has_secure_password
  
    enum role: { buyer: 'buyer', seller: 'seller' }
  
    has_many :orders, foreign_key: 'buyer_id'
    has_many :products, foreign_key: 'seller_id'
    
    has_one_attached :profile_image
  
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }
    validates :role, presence: true
end
  