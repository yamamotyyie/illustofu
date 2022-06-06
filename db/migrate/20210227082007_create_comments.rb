class CreateComments < ActiveRecord::Migration[6.0]
  # コメントのテーブル設定
  def change
    create_table :comments do |t|
      # コメントのレコード設定
      t.text :messeage,null:false
      # userテーブルと結びつけ
      t.references :user, foreign_key: true, null: false
      # illustテーブルと結びつけ
      t.references :illust, foreign_key: true, null: false
      t.timestamps
    end
  end
end
