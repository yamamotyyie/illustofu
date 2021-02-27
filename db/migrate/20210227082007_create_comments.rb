class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :messeage,null:false
      t.references :user, foreign_key: true, null: false
      t.references :illust, foreign_key: true, null: false
      t.timestamps
    end
  end
end
