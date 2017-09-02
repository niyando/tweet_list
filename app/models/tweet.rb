class Tweet < ActiveRecord::Base
  belongs_to :compilation
  validates_presence_of :compilation, :link
  validates :link, uniqueness: { scope: :compilation_id }
  
end