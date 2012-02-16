class User < ActiveRecord::Base
  tango_user

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :posts

  def create_post(params={})
    post = new_post(params)
    post.save
    post
  end

  def new_post(params={})
    Post.new(params.merge(user: self))
  end

  def self.guest
    session[:guest_user] ||= Guest.new # create Guest model (usually not to be persisted!)
  end
end
