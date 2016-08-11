class CreateChuckNorrises < ActiveRecord::Migration
  def change
    create_table :chuck_norrises do |t|
      t.text :fact
      t.integer :knockouts

      t.timestamps null: false
    end
  end
end
