class FavouriteCompilation < ActiveRecord::Base
  belongs_to :user
  belongs_to :compilation, counter_cache: :fave_count

  validates_presence_of :user, :compilation

end