class Post < ApplicationRecord

	belongs_to :user

	has_many_attached :images

	has_many :comment

	attachment :profile_image


end
