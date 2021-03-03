# アプリ名
いらすとーふ

# アプリケーション概要
 誰でも気楽にまったりとイラスト投稿ができるアプリです。  
 ログインしたユーザーは新規投稿画面からイラストを投稿でき、いつでも編集と削除ができる。  
 また、他の人の投稿したイラストにコメントを送り、交流することができます。

# 本番環境
### URL  
[いらすとーふ](https://illustofu.herokuapp.com/ "トップページ")
### ユーザー認証
ID...admin  
pass...2222
### テストユーザー
email...aaa@example  
pass...test123

# 制作背景
Twitterにて同じ絵描きのフォロワーさんと交流していて、フォロワーさんが「イラストを投稿するなら何処がいいのだろう？」と呟いていた。  
思いついたのがpixivだったが「pixivは敷居が高い」と言っていたので、自分の絵に自信があまりない人が気楽に絵を投稿できるアプリがあったらいいのではないかと考え、制作に取り組みました。
# DEMO
### イラスト投稿機能
![demo](https://gyazo.com/a58ce2a7a889f4039af2d3785a20ea4b/raw)
### コメント機能
![demo](https://gyazo.com/ee5a3ee67dfc997586400d26b978ba1b/raw)

# 工夫したポイント
気軽に使えるようオシャレになり過ぎず緩い感じになるようにビューを作成しました。  「いらすとーふ」というアプリ名にちなみ、フォームや表示画面は豆腐に見えるようにbox-shadowを試しました。

開発においては、作業中は次に何をすべきか迷わないように、機能に優先順位をつけ、予め次にする作業を紙に書きながら進めていました。

# 使用技術(開発環境)
HTML・CSS・Ruby・Ruby on Rails・GitHub

# 課題や今後実装したい機能
.「いいね！」機能  
.タグ機能  
.イラスト投稿時のプレビュー機能  
.コメントのメンション機能
.ユーザーマイページ機能（そのユーザーが過去に投稿したイラストを見ることができる）

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
