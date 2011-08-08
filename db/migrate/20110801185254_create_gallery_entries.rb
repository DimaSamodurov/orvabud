class CreateGalleryEntries < ActiveRecord::Migration

  def self.up
    create_table :gallery_entries do |t|
      t.integer :gallery_section_id
      t.integer :image_id
      t.string :title
      t.integer :position

      t.timestamps
    end

    add_index :gallery_entries, :id
    add_index :gallery_entries, :gallery_section_id
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "gallery_entries"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/gallery_entries"})
    end

    drop_table :gallery_entries
  end

end
