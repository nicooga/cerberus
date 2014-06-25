namespace :db do
  namespace :migrate do
    desc <<-STR
      Migrate the database through scripts in vendor/plugins/yaffle/lib/db/migrate
      and update db/schema.rb by invoking db:schema:dump.
      Target specific version with VERSION=x. Turn off output with VERBOSE=false.
    STR

    task cerberus: :environment do
      ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
      ActiveRecord::Migrator.migrate(
        File.join(Cerberus.root, "lib/db/migrate/"),
        ENV["VERSION"] ? ENV["VERSION"].to_i : nil)
      Rake::Task["db:schema:dump"].invoke if ActiveRecord::Base.schema_format == :ruby
    end
  end
end
