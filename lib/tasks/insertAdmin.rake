#small script that automatically creates an admin user
puts 'creating admin user...'
namespace :db do
  namespace :admin_setup do
    task :admin => :environment do
      @password_salt = BCrypt::Engine.generate_salt
      @password = "admin"
      admin = User.create(
        :username => "admin", 
        :email => "admin@admin.com", 
        :password_salt => @password_salt,
        :password_hash => BCrypt::Engine.hash_secret(@password, @password_salt), 
        :fullName => "admin",
        :bio => "admin"
      )
    end
  end
end