require "test_helper"

class BooksFlowTest < ActionDispatch::IntegrationTest
  test "should not create book with future published_date" do
    future_date = Date.today + 1.year

    post books_url, params: {
      book: {
        title: "Future Book",
        author: "Future Author",
        published_date: future_date,
        price: 29.99
      }
    }

    assert_response :unprocessable_entity
    assert_select "li", text: "Published date can't be in the future"
  end

  test "should create book with valid published_date" do
    past_date = Date.today - 1.year

    assert_difference("Book.count", 1) do
      post books_url, params: {
        book: {
          title: "Valid Book",
          author: "Valid Author",
          published_date: past_date,
          price: 19.99
        }
      }
    end

    assert_redirected_to book_url(Book.last)
  end
end
