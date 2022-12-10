class CreateJwtAllowlistedjwts < ActiveRecord::Migration[7.0]
  def change
    create_table :jwt_allowlistedjwts do |t|
      t.string :jti
      t.datetime :exp

      t.timestamps
    end
    add_index :jwt_allowlistedjwts, :jti
  end
end
