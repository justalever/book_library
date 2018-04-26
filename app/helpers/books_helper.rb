module BooksHelper
  def user_added_to_library? user, book
    user.libraries.where(user: user, book: book).any?
  end
end
