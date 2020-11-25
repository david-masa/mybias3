# アプリ概要　MyBias!!とは
## あなたの推しを紹介するアプリです。
![トップ画像](https://user-images.githubusercontent.com/60571920/100077533-cf659080-2e85-11eb-874a-12fe855ac30d.png)

### URL
#### http://mybias.tokyo/

### 使用技術
#### 言語・フレームワーク・ライブラリ
- Ruby on Rails
- HTML, CSS, Bootstrap
- Java Script
- jQuery

#### 環境
- インフラ
  - AWS EC2 Route53
  - Capistranoによる自動デプロイ
- サーバー
  - Unicorn
  - Nginx

#### ツール
GitHub （チーム開発を想定し、各タスクごとにブランチとプルリクエストを作成）

### 機能
- 推し動画
  - 投稿機能
  - 一覧表示機能
    - カテゴリー機能
    - ページネーション機能
  - 詳細表示機能
    - コメント機能
    - いいね機能
- いいねランキング表示機能
- ユーザー登録、編集、削除機能
- レスポンシブ対応
- ゲストログイン機能

### カテゴリー機能
![カテゴリー機能](https://user-images.githubusercontent.com/60571920/100077551-d5f40800-2e85-11eb-9259-0ecef85979c6.jpg)

### いいねランキング機能
![いいねランキング機能](https://user-images.githubusercontent.com/60571920/100077556-d7bdcb80-2e85-11eb-84c5-2b397e2514e0.png)

### レスポンシブデザイン
![レスポンシブデザイン](https://user-images.githubusercontent.com/60571920/100160777-9106ba80-2ef3-11eb-88bb-d2bbd98ed485.gif)

## Postsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|title|string|null: false|
|reason|text|null: false|
|category_id|integer|default: 0|
|youtube_url|string|null: false|

### Association
belongs_to :user<br>
has_many :comments, dependent: :destroy<br>
has_many :likes<br>
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
has_many :posts, dependent: :destroy<br>
has_many :comments, dependent: :destroy<br>
has_many :likes, dependent: :destroy<br>
has_many :liked_posts, through: :likes, source: :post

## Commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference||
|post_id|reference||
|text|text||

### Association
belongs_to :post<br>
belongs_to :user

## Likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference||
|post_id|reference||

### Association
belongs_to :post<br>
belongs_to :user<br>
validates_uniqueness_of :post_id, scope: :user_id