require "active_record"

task default: %w[]

namespace :db do

  db_config = YAML::load(File.open("config/database.yml"))

  desc "Create a db/schema.rb file"
  task :schema do
    ActiveRecord::Base.establish_connection(db_config)
    require 'active_record/schema_dumper'
    filename = "db/schema.rb"
    File.open(filename, "w:utf-8") do |file|
      ActiveRecord::SchemaDumper.dump(ActiveRecord::Base.connection, file)
    end
  end

  desc "Migrate the database"
  task :migrate do
    ActiveRecord::Base.establish_connection(db_config)
    ActiveRecord::Base.connection.migration_context.migrate

    Rake::Task["db:schema"].invoke
    puts "Database migrated."
  end

  desc "Rollback last migration"
  task :rollback do
    ActiveRecord::Base.establish_connection(db_config)
    ActiveRecord::Base.connection.migration_context.rollback(1)

    Rake::Task["db:schema"].invoke
    puts "Database rollback."
  end


end

namespace :g do
  desc "Generate migration"
  task :migration do
    name = ARGV[1] || raise("Specify name: rake g:migration your_migration")
    timestamp = Time.now.strftime("%Y%m%d%H%M%S")
    path = File.expand_path("../db/migrate/#{timestamp}_#{name}.rb", __FILE__)
    migration_class = name.split("_").map(&:capitalize).join

    File.open(path, 'w') do |file|
      file.write <<-EOF
class #{migration_class} < ActiveRecord::Migration[6.0]
  def self.up
  end

  def self.down
  end
end
    EOF
    end

    puts "Migration #{path} created"
    abort
  end
end
