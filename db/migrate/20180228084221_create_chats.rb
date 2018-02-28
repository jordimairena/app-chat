class CreateChats < ActiveRecord::Migration[5.1]
  def change
    create_table :chats do |t|
      t.text :mensaje
      t.integer :id_r
      t.integer :id_e

      t.timestamps
    end
    add_index :chats, :id_r
    add_index :chats, :id_e
  end
end
