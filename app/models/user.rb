#require 'role_model'
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable


  has_many :posts

  has_and_belongs_to_many :roles

  #include RoleModel

  #attr_accessible :email, :password, :password_confirmation, :remember_me, :roles, :roles_mask

  # optionally set the integer attribute to store the roles in,
  # :roles_mask is the default
  #roles_attribute :roles_mask

  # declare the valid roles -- do not change the order if you add more
  # roles later, always append them at the end!
  #roles :admin, :editor, :guest


  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(name:auth.extra.raw_info.name,
                               provider:auth.provider,
                                       uid:auth.uid,
                                          email:auth.info.email,
                                               password:Devise.friendly_token[0,20])
      end
    end
  end


end
