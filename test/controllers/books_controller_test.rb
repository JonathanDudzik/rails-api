require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:genericBook)
  end

  test "should get index" do
    get '/books'
    assert_response :success
  end

  test "should create book" do
    assert_changes -> {Book.count} do
      post '/books', params: {
        book: {
          title: "Integration Test",
          language: "English",
          author: "Jonathan D.",
          published: 1999,
          excerpt: "Good things come to those who wait.",
        }
      }
    end
  end

  test "should delete book" do
    assert_changes -> {Book.count} do
      delete "/books/#{Book.first.id}"
    end
  end
end
