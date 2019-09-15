FactoryBot.define do

    factory :guest_user, class: 'User' do 
        id { 1 }
        username  { 'guestUsername' }
        email { 'guestEmail@guestEmail.com' }
        password_hash { 'guestPassword' }
        password_salt { 'guestSalt' }
        fullName { 'guestFullName' }
        bio { 'guestFullName' }
    end

    factory :current_user, class: 'User' do
        id { 2 }
        username { 'currentUsername' }
        email { 'currentUsername@currentUsername.com' }
        password_hash { 'currentPassword' }
        password_salt { 'currentSalt' }
        fullName { 'guestFullName' }
        bio { 'guestFullName' }
    end 

   

end 