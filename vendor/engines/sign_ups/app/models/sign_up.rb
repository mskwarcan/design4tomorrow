class SignUp < ActiveRecord::Base

  acts_as_indexed :fields => [:name, :email, :phone, :organization, :plan, :deadline, :current_site, :information, :additional]

  validates :name, :presence => true, :uniqueness => true
  
end
