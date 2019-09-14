FactoryBot.define do
    # factory :user do 
    #     username { 'guestUsername' }
    #     email { 'guestEmail@guestEmail.com'}
    # end 
    factory :guest_user, class: 'User' do 
        username  { 'guestUsername' }
        email { 'guestEmail@guestEmail.com' }
    end

    factory :current_user, class: 'User' do 
        username { 'currentUsername' }
        email { 'currentUsername@currentUsername.com' }
    end 

   

end 