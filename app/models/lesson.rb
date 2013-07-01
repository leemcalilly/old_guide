class Lesson < ActiveRecord::Base
  validates_presence_of     :title
  validates_uniqueness_of   :title
  validates_length_of       :title, :within => 5..240
end
