class Compilation < ActiveRecord::Base
  belongs_to :user
  has_many :tweets, dependent: :destroy
  has_many :favourite_compilations
  has_many :favourited_by, through: :favourite_compilations, source: :user

  validates_presence_of :user, :title

  accepts_nested_attributes_for :tweets, :reject_if => lambda { |a| a[:link].blank? }, allow_destroy: true

  def to_param
    [id, title.parameterize].join("-")
  end

end