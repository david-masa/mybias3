class Post < ApplicationRecord
  validates :user_id, length: { maximum: 255 }
  validates :title, presence: true
  validates :reason, presence: true, length: { maximum: 255 }
  validates :youtube_url, presence: true
  validates :category_id, presence: true
  enum category_id: { KPOP: 1, JPOP: 2, ThaiPOP: 3, ChinesePOP: 4, RussianPOP: 5, IndianPOP: 6 }
end
