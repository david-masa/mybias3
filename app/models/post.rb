class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  validates :user_id, length: { maximum: 255 }
  validates :title, presence: true
  validates :reason, presence: true, length: { maximum: 255 }
  validates :youtube_url, presence: true
  validates_format_of :youtube_url, with: /\A[a-zA-Z0-9]+\z/
  validates :category_id, presence: true
  enum category_id: { KPOP: 1, JPOP: 2, ThaiPOP: 3, ChinesePOP: 4, RussianPOP: 5, IndianPOP: 6 }

end
