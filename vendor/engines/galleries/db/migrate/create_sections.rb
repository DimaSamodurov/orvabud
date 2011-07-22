class CreateSections < ActiveRecord::Migration

  def self.up
    create_table :sections do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end

    add_index :sections, :id

    load(Rails.root.join('db', 'seeds', 'sections.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "sections"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/sections"})
    end

    drop_table :sections
  end

end
