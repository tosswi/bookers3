class Book < ApplicationRecord
	has_many :book_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	validates :title, presence: true
	validates :body, length:{in: 1..200 }, allow_blank: true
    validates :body, presence: true
    belongs_to :user
    def favorited_by?(user)
    	favorites.where(user_id: user.id).exists?
    end
end
