class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:user,:editor,:admin]
  after_initialize :set_default_role, :if=> :new_record?
  def set_default_role
  	self_role ||= :user
  end
  has_one_attached :image
end
