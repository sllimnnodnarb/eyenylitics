class RegisteredApplication < ActiveRecord::Base
  belongs_to :user
  has_many :events
  default_scope { order('created_at DESC') }
end
