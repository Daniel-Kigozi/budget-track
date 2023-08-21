class CreateSectionsTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :sections_transactions do |t|
      t.references :section, null: false, foreign_key: true
      t.references :transaction, null: false, foreign_key: true

      t.timestamps
    end
  end
end
