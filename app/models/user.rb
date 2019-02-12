class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	has_many :projects, through: :users_projects

  def full_name
    self.first_name.to_s + " " + self.last_name.to_s
  end
end
