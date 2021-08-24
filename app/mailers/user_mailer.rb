class UserMailer < ApplicationMailer
    default from: 'halkatran@gmail.com'
    def welcome_email(user)
        @user=user
        @url='http://example.com/login'
        mail(to: user.email, subject: 'Welcome')
    end
end
