class User < ApplicationRecord
    has_secure_password
  
    enum role: { buyer: 'buyer', seller: 'seller', seller_buyer: 'seller_buyer' }
  
    has_many :orders, foreign_key: 'buyer_id'
    has_many :products, foreign_key: 'seller_id'
  
    has_one_attached :profile_image
  
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }, if: :password_required?
    validates :password_confirmation, presence: true, if: :password_required?
    validates :role, presence: true
  
    private
  
    def password_required?
      new_record? || !password.nil?
    end
end
  