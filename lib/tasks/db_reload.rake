namespace :db do
    desc 'Drop, create, migrate, and seed a database'
    task :reload => :environment do
      puts "Environment Check: Rails Environment = #{Rails.env}"
      Rake::Task['db:drop'].reenable
      Rake::Task['db:drop'].invoke
      Rake::Task['db:create'].reenable
      Rake::Task['db:create'].invoke
      Rake::Task['db:migrate'].reenable if Rails.env.development?
      Rake::Task['db:migrate'].invoke if Rails.env.development?
      Rake::Task['db:migrate'].reenable if Rails.env.test?
      Rake::Task['db:migrate'].invoke if Rails.env.test?
      Rake::Task['db:schema:load'].reenable if Rails.env.development?
      Rake::Task['db:schema:load'].invoke if Rails.env.development?
      Rake::Task['db:schema:load'].reenable if Rails.env.test?
      Rake::Task['db:schema:load'].invoke if Rails.env.test?
      Rake::Task['db:fixtures:load'].reenable if Rails.env.test?
      Rake::Task['db:fixtures:load'].invoke if Rails.env.test?
      Rake::Task['db:fixtures:load'].reenable if Rails.env.development?
      Rake::Task['db:fixtures:load'].invoke if Rails.env.development?
    #   Rake::Task['db:test:prepare'].reenable if Rails.env.test?
    #   Rake::Task['db:test:prepare'].invoke if Rails.env.test?
    #   Rake::Task['db:seed'].reenable
    #   Rake::Task['db:seed'].invoke
    end
  
    desc 'Drop, create, migrate, and seed development and test databases'
    namespace :reload do
      task :all do
        ['development','test'].each do |env|
          Rails.env = env
          puts "=== Starting #{Rails.env} reload ===\n\n"
          Rake::Task['db:reload'].reenable
          Rake::Task['db:reload'].invoke
          puts "=== Finishing #{Rails.env} reload ===\n\n"
          Rake::Task['db:fixtures:load'].reenable if Rails.env.test?
          Rake::Task['db:fixtures:load'].invoke if Rails.env.test?
          Rake::Task['db:fixtures:load'].reenable if Rails.env.development?
          Rake::Task['db:fixtures:load'].invoke if Rails.env.development?
        end
      end
    end
  end