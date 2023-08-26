class CreateSectionPayments < ActiveRecord::Migration[7.0]
  def change
    create_table :section_payments do |t|
      t.references :section, null: false, foreign_key: true
      t.references :payments, null: false, foreign_key: true

      t.timestamps
    end
  end
end
