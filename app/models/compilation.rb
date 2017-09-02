class Compilation < ActiveRecord::Base
  belongs_to :user
  has_many :tweets, dependent: :destroy

  validates_presence_of :user, :title
end