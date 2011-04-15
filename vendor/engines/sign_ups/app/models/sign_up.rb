class SignUp < ActiveRecord::Base

  acts_as_indexed :fields => [:name, :email, :phone, :organization, :plan, :deadline, :current_site, :information, :additional]

  validates :name, :presence => true
  validates :email, :presence => true
  validates :phone, :presence => true
  validates :organization, :presence => true
  validates :information, :presence => true
  
end
