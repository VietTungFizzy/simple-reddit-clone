class CreatePost < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :communities
      t.references :accounts
      t.string :title
      t.text :body
      t.timestamps
    end
  end
end
