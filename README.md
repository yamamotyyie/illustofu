# アプリ名
いらすとーふ

# アプリケーション概要
 
誰でも気楽にイラストの投稿ができる。投稿したイラストは、投稿した後に不備があれば修正した後の絵を投稿できる。  
また、他の人のイラストにコメントを送り、投稿主と交流することができる。

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
