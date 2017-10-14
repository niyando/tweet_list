class FavouriteCompilation < ActiveRecord::Base
  belongs_to :user
  belongs_to :compilation

  validates_presence_of :user, :compilation

end