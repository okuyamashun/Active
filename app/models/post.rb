class Post < ApplicationRecord

	belongs_to :user

	has_many_attached :images

	has_many :comments

	has_many :favorites

	has_many :favorited_users, through: :favorites, source: :user

	attachment :profile_image

end
