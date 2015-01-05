class Workout < ActiveRecord::Base
  belongs_to :user
  has_many :exercises

  validates :title,
    presence: true

  validates :date,
    presence: true

end
