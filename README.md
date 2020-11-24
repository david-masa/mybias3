## Postsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|title|string|null: false|
|reason|text|null: false|
|category_id|integer|default: 0|
|youtube_url|string|null: false|

### Association
belongs_to :user
has_many :comments, dependent: :destroy
has_many :likes
has_many :liked_users, through: :likes, source: :user

## Userテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, default: ""|
|encrypted_password|string|null: false, default: ""|
|image|string||
|reset_password_token|string||
|reset_password_sent_at|datetime||
|remember_created_at|datetime||

### Association
has_many :posts, dependent: :destroy
has_many :comments, dependent: :destroy
has_many :likes, dependent: :destroy
has_many :liked_posts, through: :likes, source: :post

## Commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference||
|post_id|reference||
|text|text||

### Association
belongs_to :post
belongs_to :user

## Likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference||
|post_id|reference||

### Association
belongs_to :post
belongs_to :user
validates_uniqueness_of :post_id, scope: :user_id