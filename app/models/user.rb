class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :posts, dependent: :delete_all

         has_many :active_follows,class_name: "Follow", foreign_key: "follower_id", dependent: :destroy

         has_many :passive_follows, class_name: "Follow", foreign_key: "following_id", dependent: :destroy

         has_many :following, through: :active_follows, source: :following

         has_many :followers, through: :passive_follows, source: :follower

         has_many :active_follows,class_name:  "Follow", foreign_key: "following_id", dependent: :destroy

         has_many :passive_follows, class_name: "Follow", foreign_key: "following_id", dependent: :destroy

         has_many :followers, through: :passive_follows, source: :follower

          # ユーザーをフォローする
          def follow(other_user)
            active_follows.create(following_id: other_user.id)
          end

          # ユーザーをアンフォローする
          def unfollow(other_user)
            active_follows.find_by(following_id: other_user.id).destroy
          end

          # 現在のユーザーがフォローしてたらtrueを返す
          def following?(other_user)
            following.include?(other_user)
          end




         has_many :comments, dependent: :delete_all

         has_many :favorites, dependent: :delete_all

         has_many :favorited_posts, through: :favorites, source: :post

         def already_favorited?(post)
		      self.favorites.exists?(post_id: post.id)
		     end

         acts_as_paranoid

         attachment :profile_image

end
