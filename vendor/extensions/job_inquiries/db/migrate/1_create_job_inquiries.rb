class CreateJobInquiries < ActiveRecord::Migration

  def up
    create_table :refinery_job_inquiries do |t|
      t.string :name
      t.text :message
      t.string :job_type
      t.boolean :brochure
      t.string :qualification

     t.timestamps
    end

    add_index :refinery_job_inquiries, :id
  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "job_inquiries"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/job_inquiries"})
    end

    drop_table :refinery_job_inquiries
  end

end
