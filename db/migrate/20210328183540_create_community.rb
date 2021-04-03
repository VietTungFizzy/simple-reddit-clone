class CreateCommunity < ActiveRecord::Migration[6.1]
  def change
    create_table :communities do |t|
      t.references :accounts
      t.string :name
      t.string :url
      t.string :rules, default: "nothing"
      t.integer :total_members, default: 0
      t.timestamps
    end
  end
end
