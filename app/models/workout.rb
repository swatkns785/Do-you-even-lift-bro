class Workout < ActiveRecord::Base
  belongs_to :user

  validates :title,
    presence: true

  validates :date,
    presence: true
end
