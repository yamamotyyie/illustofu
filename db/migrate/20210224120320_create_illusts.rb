class CreateIllusts < ActiveRecord::Migration[6.0]
  def change
    create_table :illusts do |t|

      t.timestamps
    end
  end
end
