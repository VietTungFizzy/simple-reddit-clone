class FixCommunityReferences < ActiveRecord::Migration[6.1]
  def change
    remove_reference :communities, :accounts, index: true, foreign_key: false
    add_reference :communities, :account, index: true, foreign_key: true
  end
end
