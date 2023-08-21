class AddUserRefToSections < ActiveRecord::Migration[7.0]
  def change
    add_reference :sections, :user, null: false, foreign_key: true
  end
end
