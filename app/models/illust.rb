class Illust < ApplicationRecord
  # 一つのイラストは一人のユーザーを持つ
  belongs_to :user
  # 一つのイラストは複数のコメントを持つ。イラストが消えるとコメントも消える
  has_many :comments , dependent: :destroy
  # イラストと画像の結びつけ
  has_one_attached :image
  # 各バリデーション
  with_options presence: true do
    validates :title
    validates :text
    validates :image
  end

end
