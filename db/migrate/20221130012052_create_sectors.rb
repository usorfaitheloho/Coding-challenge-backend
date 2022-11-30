class CreateSectors < ActiveRecord::Migration[7.0]
  def change
    create_table :sectors do |t|
      t.string :sector_name
      t.references :user, index: true,  foreign_key: { to_table: :users}

      t.timestamps
    end
  end
end
