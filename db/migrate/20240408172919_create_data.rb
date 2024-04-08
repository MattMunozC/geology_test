class CreateData < ActiveRecord::Migration[7.1]
  def change
    create_table :data do |t|
      t.string :external_id
      t.boolean :tsunami
      t.string :magType
      t.text :url
      t.text :place
      t.string :title
      t.timestamps
    end
    add_column :data, :magnitude, :decimal
    add_column :data, :longitude, :decimal
    add_column :data, :latitude, :decimal
    add_column :data, :time, :string

  end
end
