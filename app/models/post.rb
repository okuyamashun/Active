class Post < ApplicationRecord

	belongs_to :user

	has_many_attached :images

	has_many :comments, dependent: :destroy

	has_many :favorites, dependent: :delete_all

	has_many :favorited_users, through: :favorites, source: :user

	validates :title, length: { in: 1..30}

	validates :posted_details, length: { in: 1..3000}

	validates :location, length: { in: 1..30}


end
