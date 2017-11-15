class UserMailer < ApplicationMailer
  default from: 'baczynskiwojtek@interia.pl'
  layout 'mailer'

  def confirm_email(user, book)
    @user = user
    @book = book

    mail(to: 'baczynskiwojtek@gmail.com', subject: "Wypożyczyłeś: #{@book.title}")
  end
end
