class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.references :datum, foreign_key: true, index: true
      t.text :comment, null: false
      t.timestamps
    end
  end
end
