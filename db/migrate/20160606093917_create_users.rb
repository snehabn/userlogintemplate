class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_hash

      t.timestamp null: false
    end
  end
end
