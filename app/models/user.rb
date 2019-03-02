class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # associations
  has_one :user_profile, dependent: :destroy
  has_many :memberships, dependent: :destroy # TODO: maybe add before/after_destroy callback to send message to workspace saying user destroyed
  has_many :workspaces, :through => :memberships
end
