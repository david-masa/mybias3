##### アプリ概要　MyBias!!とは
#### あなたの推しを紹介するアプリです。
トップ画像

### URL
## http://mybias.tokyo/

### 使用技術
## 言語・フレームワーク・ライブラリ
- Ruby on Rails
- HTML, CSS, Bootstrap
- Java Script
- jQuery

## 環境
- インフラ
  - AWS EC2 Route53
  - Capistranoによる自動デプロイ
- サーバー
  - Unicorn
  - Nginx

## ツール
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