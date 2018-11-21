class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :open_id
      t.string :avatarUrl
      t.string :nickName


      t.timestamps
    end
  end
end
