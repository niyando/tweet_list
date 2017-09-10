class Compilation < ActiveRecord::Base
  belongs_to :user
  has_many :tweets, dependent: :destroy

  validates_presence_of :user, :title

  accepts_nested_attributes_for :tweets, :reject_if => lambda { |a| a[:link].blank? }, allow_destroy: true

  def to_param
    [id, title.parameterize].join("-")
  end

end