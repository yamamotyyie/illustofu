# アプリ名
いらすとーふ

## 基本情報
__アプリケーション概要__  
自分の描いたイラストを投稿できる。投稿したイラストは、投稿した後に不備があれば修正した後の絵を投稿できる。  
また、他の人のイラストにコメントを送り、投稿主と交流することができる。  
__利用方法__  
ユーザー登録画面で新規アカウントを作成。トップページからイラスト投稿ボタンを押すことで、投稿画面へ遷移。  
投稿が完了すると、トップページに戻り、投稿された最新のイラストはトップページに表示される。  
イラストをクリックすると詳細画面にいき、詳細画面からイラストにコメントを投稿できる。  
__目指した課題解決__  
イラストを始めたばかりの人が気軽に描いた絵を投稿でき、フィードバックを貰うことによって  
イラストのモチベーションを上げて、心が折れずに上達することができるようになる。  
# 要件定義
|   優先順位   |  機能  | 目的 | 詳細 | ストーリー | 見積もり |
| ---------- | ------ | --------- | --------| -------| --------|
| 1 | ユーザー管理機能 |ログインしているユーザーがイラストを投稿できる|deviseを導入|パスワードと名前は必須|5時間|
| 2 | イラスト投稿機能 |イラストを投稿、編集、削除できる。イラストをクリックすると詳細画面へいける|イラストの投稿、編集、削除ができる|イラストは必須。投稿した人の名前と作品名を表示|5時間|
| 3 | 感想（コメント）機能 |イラストに対してコメントできる|イラストの詳細画面からコメントを送ることができる|コメントを送るのに失敗したら、その画面に留まる|5時間|
# テーブル設計
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
