class UserMailer < ApplicationMailer

    def welcome
        @user = User.last
        mail to: @user.email, subject: "Welcome to our site", form: 'info@gmail.com' 
    end
end
