# This migration comes from refinery_cursos (originally 1)
class CreateCursosCursos < ActiveRecord::Migration

  def up
    create_table :refinery_cursos do |t|
      t.string :name
      t.date :start_date
      t.decimal :price
      t.integer :photo_id
      t.text :description
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-cursos"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/cursos/cursos"})
    end

    drop_table :refinery_cursos

  end

end
