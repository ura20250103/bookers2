class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :favorites, dependent: :destroy
  attachment :profile_image # ここを追加
  has_many :books, dependent: :destroy
  validates :name, {presence: true,length: { maximum: 20 }}
  validates :introduction, length: { maximum: 50 }
  validates :name,    length: { minimum: 2 }


end
