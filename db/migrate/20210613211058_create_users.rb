class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :image
      t.string :name, null:false
      t.string :introduction
      t.string :email, null:false
      t.string :password_digest, null:false

      t.timestamps
      t.index :email, unique: true
    end
  end
end
