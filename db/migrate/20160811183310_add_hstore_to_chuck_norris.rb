class AddHstoreToChuckNorris < ActiveRecord::Migration
  def change
    enable_extension 'hstore'
    remove_column :chuck_norrises, :fact, :text
    remove_column :chuck_norrises, :knockouts, :integer
    add_column :chuck_norrises, :kungfu, :hstore
    add_index :chuck_norrises, :kungfu, using: :gin      # Index is required for hstore
  end
end
