class Post < ActiveRecord::Base
  include PublicActivity::Model
  tracked
  has_many :comments, dependent: :destroy
  belongs_to :user
end
