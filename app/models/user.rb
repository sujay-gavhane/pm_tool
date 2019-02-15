class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects, through: :assigned_projects
  has_many :todos

  after_create :assign_default_role

  def full_name
    self.first_name.to_s + " " + self.last_name.to_s
  end

  def assign_default_role
    self.add_role(:developer) if self.roles.blank? && self.email != 'admin@pmtool.com'
  end
end
