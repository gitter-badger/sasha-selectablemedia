class Customer < ActiveRecord::Base
  attr_accessible :date_of_birth, :email, :first_name, :last_name, :phone
  
  validates :first_name, :last_name, :email, presence: true
  validates :first_name, :last_name, length: { maximum: 50 }
  validates :email, length: { maximum: 200 }
  
  set_table_name 'cstr_dtls'
end
