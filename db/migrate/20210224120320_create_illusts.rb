class CreateIllusts < ActiveRecord::Migration[6.0]
  # 各カラムのレコードを指定
  def change
    create_table :illusts do |t|
      t.string :title,null: false
      t.text :text,null:false
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
