# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  password_digest :string(255)
#

class User < ActiveRecord::Base

  attr_accessible :email, 
                  :name, 
                  :password, 
                  :password_confirmation,
                  :avatar

  # Trying to use Paperclip to handle custom images.
  # has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" },
  #                             default_style: :thumb
  # has_attached_file :avatar, default_url "/images/default_:style_avatar.png"
  #has_attached_file :avatar, default_url: "app/assets/images/myrails.png"

  has_attached_file :avatar,
               :path => ":rails_root/public/system/users/avatars/:id/:style/:filename",
               :url => "/system/users/avatars/:id/:style/:filename", 
               :styles => { :medium => "300x300>", :thumb => "100x100>" },
               default_url: "/system/users/avatars/default/rails.png",
               default_path: ":rails_root/public/system/users/avatars/default/rails.png"

  # User.new.avatar_url(:small) # => "/images/default_small_avatar.png"

  has_secure_password

  before_save { |user| user.email = user.email.downcase }

  validates :name,  presence: true, 
  						      length: { maximum: 50 }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email,   presence: true, 
                      uniqueness: {case_sensitive: false},
                      format: { with: VALID_EMAIL_REGEX }

	validates :password,   presence: true,
                         length: { minimum: 6 }

	validates :password_confirmation, presence: true 

  #validates_attachment_presence :avatar
  #validates_attachment_size :avatar, less_than:  10.kilobytes
  validates_attachment_size :avatar, less_than:  10.megabytes
  validates_attachment_content_type :avatar, 
                           content_type: ['image/jpeg','image/jpg', 'image/png']
	
end
