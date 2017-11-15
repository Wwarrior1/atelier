class BookNotifierMailer < ApplicationMailer
  def book_return_remind(book)
    @book = book
    @reservation = book.reservations.find_by(status: "TAKEN")
    @borrower = @reservation.user

    mail(to: @borrower.email, subject: "Upływa termin zwrotu książki #{@book.title}")
  end

  def book_reserved_return(book)
    @book = book
    @reservation = book.reservations.find_by(status: "RESERVED")
    @borrower = @reservation.user

    mail(to: @borrower.email, subject: "Za niedługo będzie można wypożyczyć książkę #{@book.title}")
  end
end