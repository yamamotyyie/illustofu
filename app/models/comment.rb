class Comment < ApplicationRecord
  # コメントは複数のユーザーをもつ
  belongs_to :user
  # コメントは複数のイラストをもつ
  belongs_to :illust
  # メッセージの空白をバリデーション
  validates :messeage,presence: true 
end
