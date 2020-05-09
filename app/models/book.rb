class Book < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :book_comments, dependent: :destroy
	#バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
	#presence trueは空欄の場合を意味する。
	validates :title, presence: true, length: { maximum: 200 }
	validates :body, presence: true, length: {maximum: 200}

    #引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べる true or false
	def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end
end
