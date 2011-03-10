class User < ActiveRecord::Base

  before_create :encrypt_password
  
  validates :name, :password,:presence => true
  
  has_many :projects
  has_many :issues
  
  def encrypt_password
    self.salt = Digest::MD5.hexdigest(Array.new(6){rand(1024)}.join)
    self.password = Digest::SHA256.hexdigest(self.password + self.salt)
  end
  
  def correct_password? password
    password = Digest::SHA256.hexdigest(password + self.salt)
    password.eql? self.password
  end
    
end
