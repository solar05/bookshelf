class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :authors
      t.string :annotation

      t.timestamps
    end
  end
end
