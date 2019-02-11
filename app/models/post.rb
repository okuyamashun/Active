class Post < ApplicationRecord

	belongs_to :user

	has_many_attached :images

	attachment :profile_image


end
