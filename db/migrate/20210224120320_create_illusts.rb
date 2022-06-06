class CreateIllusts < ActiveRecord::Migration[6.0]
  # 各カラムのレコードを指定
  def change
    create_table :illusts do |t|
      # イラストのタイトルは必須
      t.string :title,null: false
      # テキストも必須
      t.text :text,null:false
      # userテーブルと結びつけ
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
