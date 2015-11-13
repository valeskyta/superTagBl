class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  # before_create default_role

  # enum role: [:admin, :client, :guest]

  # private
  # def default_role
  #   self.role ||=1
  # end

  # def to_s
  #   "#{self.username}"
  # end


end
