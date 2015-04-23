class SongTags < ActiveRecord::Migration
  def change
    create_table :songtags do |t|
      t.integer :song_id
      t.integer :tag_id

      t.timestamps null: false
    end
  end
end
