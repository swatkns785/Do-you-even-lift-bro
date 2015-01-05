class User < ActiveRecord::Base
  has_many :workouts
  has_many :exercises, through: :workouts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
