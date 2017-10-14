class User < ActiveRecord::Base
  has_many :compilations, dependent: :destroy

  has_many :favourite_compilations, dependent: :destroy
  has_many :favourites, through: :favourite_compilations, source: :compilation

  validates_presence_of :provider, :uid
  validates :provider, uniqueness: { scope: :uid }

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider   = auth.provider 
      user.uid        = auth.uid
      user.name       = auth.info.name
      user.nickname   = auth.info.nickname
      user.image_url  = auth.info.image
      user.save
    end
  end

end
