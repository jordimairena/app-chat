class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :primer_nombre
      t.string :apellido
      t.string :usuario
      t.references :role, foreign_key: true

      t.timestamps
    end
  end
end
