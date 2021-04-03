class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    remove_reference :posts, :accounts, index: true, foreign_key: false
    remove_reference :posts, :communities, index: true, foreign_key: false
    add_reference :posts, :account, index: true, foreign_key: true
    add_reference :posts, :community, index: true, foreign_key: true
  end
end
