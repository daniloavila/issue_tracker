class Project < ActiveRecord::Base

  validates :name, :presence => true
  
  belongs_to :user
  has_many :issues, :dependent => :delete_all
  
end
