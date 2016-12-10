class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :comments
  validates_uniqueness_of :name

  has_attached_file :avatar, styles: { medium: "700x500#", small: "200x200>", thumb: "80x80>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

end
