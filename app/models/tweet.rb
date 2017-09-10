class Tweet < ActiveRecord::Base
  belongs_to :compilation
  validates_presence_of :link
  validates :link, format:{with: /https?:\/\/twitter\.com\/\w+/i, message: :format} 
  
end