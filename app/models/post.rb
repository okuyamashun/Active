class Post < ApplicationRecord

	belongs_to :user

	has_many_attached :images

	 # has_many :image, dependent: :delete_all

	 # accepts_nested_attributes_for :image

end
