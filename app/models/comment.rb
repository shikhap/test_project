class Comment < ActiveRecord::Base
  include PublicActivity::Model
  tracked
  belongs_to :post
  belongs_to :user
end
