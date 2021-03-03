# アプリ名
いらすとーふ

# アプリケーション概要
 誰でも気楽にまったりとイラスト投稿ができるアプリです。  
 ログインしたユーザーは新規投稿画面からイラストを投稿でき、いつでも編集と削除ができる。  
 また、他の人の投稿したイラストにコメントを送り、交流することができます。

# 本番環境
__URL__  
[いらすとーふ](https://illustofu.herokuapp.com/ "トップページ")

# 制作背景

# DEMO

# 工夫したポイント

# 使用技術(開発環境)

# 課題や今後実装したい機能


# DB設計
## usersテーブル
|   Column   |  Type  | Options   |
| ---------- | ------ | --------- |
| nickname | string | null: false |
| email | string | null: false |
| encrypted_password | string | null: false |

### アソシエーション
- has_many :illusts
- has_many :comments

## illustsテーブル
|   Column   |  Type  | Options   |
| -----------| -------| ----------|
| title | string | null:false|
| text | text | null:false|
| user | reference | null:false foreign_key: true|

### アソシエーション
- belongs_to :user
- has_many :comments

## commentsテーブル
|  Column  | Type  | Options |
| ---------| ----- | ------- |
| messeage | text| null:false |
| user | reference | null: false foreign_key: true |
| illust | reference | null: false foreign_key: true |

### アソシエーション
- belongs_to :user
- belongs_to :illust
