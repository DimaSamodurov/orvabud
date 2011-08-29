class CreateGallerySections < ActiveRecord::Migration

  def self.up
    create_table :gallery_sections do |t|
      t.string :name
      t.text    :content
      t.boolean :active
      t.integer :position

      t.timestamps
    end

    add_index :gallery_sections, :id

    load(Rails.root.join('db', 'seeds', 'gallery_sections.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "gallery_sections"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/gallery/sections"})
    end

    drop_table :gallery_sections
  end

end
