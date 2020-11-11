## Postsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|title|string|null: false|
|reason|text|null: false|
|category_id|reference|null: false, foreign_key: true|
|youtube_url|string|null: false|

### Association
belongs_to :user</br>
belongs_to :category</br>