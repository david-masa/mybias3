# アプリ概要　MyBias!!とは
## あなたの推しを紹介するアプリです。
![トップ画像](https://user-images.githubusercontent.com/60571920/108160015-927b0400-712b-11eb-88ad-5944048622f4.png)

### URL
#### http://mybias.tokyo/
#### 54.168.35.109

### 使用技術
#### 言語・フレームワーク・ライブラリ
- Ruby on Rails
- HTML, CSS, Bootstrap
- Java Script
- jQuery
- ajax（非同期通信）

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
  - 検索機能
- いいねランキング表示機能
- ユーザー登録、編集、削除機能
- レスポンシブ対応
- ゲストログイン機能

### 制作背景
新型コロナウイルス感染拡大に伴い、全世界で外出自粛が浸透してきました。そういった情勢の中で、Youtube動画などを視聴する機会も多くなってきました。<br>
ただ日頃Youtubeを再生し続けていると、だんだんと表示動画が自分向けにパーソナライズされていき、新しい驚きや発見から遠のいてしまいます。<br>
このアプリMyBiasは、ユーザーがそれぞれの好きなアイドルや歌手、すなわち推し（Bias）を紹介し、推しの評判を広めるとともに、他のユーザーの推しを知り、新しい驚きや発見を与えてくれます。<br>
またグローバル化が広まる中で、とっつきやすい歌やアイドルを通して、異なる文化や多様性を理解するツールにもなります。<br>
<br>
このアプリを利用することで、おうち時間をもっと快適なものにし、異なる文化への理解を深めていただく一助になれば幸いです。

### カテゴリー機能
![カテゴリー機能](https://user-images.githubusercontent.com/60571920/100077551-d5f40800-2e85-11eb-9259-0ecef85979c6.jpg)

### いいねランキング機能
![いいねランキング機能](https://user-images.githubusercontent.com/60571920/100077556-d7bdcb80-2e85-11eb-84c5-2b397e2514e0.png)

### 検索機能
![検索ページトップ画像](https://user-images.githubusercontent.com/60571920/108161598-b4c25100-712e-11eb-9905-f02766ac99cc.png)

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