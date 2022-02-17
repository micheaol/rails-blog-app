class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :photo, null: false, default: 'https://avatars.githubusercontent.com/u/10332499?v=4'
      t.string :bio, null: false
      t.integer :post_counter, default: 0, null: false

      t.timestamps
    end
  end
end
