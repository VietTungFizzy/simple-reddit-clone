class Post < ApplicationRecord
  belongs_to :account
  belongs_to :community
  has_many :comments
  validates_presence_of :title, :body
end
