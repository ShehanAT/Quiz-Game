FactoryBot.define do
    factory :guest_user, class: 'User' do 
        id { 1 }
        username  { 'guestUsername' }
        email { 'guestEmail@guestEmail.com' }
        password { 'guestPassword' }
        fullName { 'guestFullName' }
        bio { 'guestFullName' }
    end
end 