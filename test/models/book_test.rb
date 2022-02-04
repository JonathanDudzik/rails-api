require "test_helper"

class BookTest < ActiveSupport::TestCase
  fixtures :books

  test "book title" do
    @book = Book.new
    @book.save # Errors are not populated before record attempts to save
    assert_equal ["The title must be entered"], @book.errors[:title]
    assert_equal ["Image must be attached and a GIF, JPEG, or PNG file"], @book.errors[:image]
    
    @book.title = nil
    @book.save
    assert_equal ["The title must be entered"], @book.errors[:title]
    
    @book.title = ""
    @book.save
    assert_equal ["The title must be entered"], @book.errors[:title]
    
    @book.title = "My First Publication"
    @book.save
    assert @book.errors[:title].size === 0
  end

  def new_book(year)
    @book = Book.new
    @book.title = "My Book Title"
    @book.image.attach(io: File.open("./storage/seed-and-default-images/default-image.png"), filename: 'default-image.png')
    @book.published = year
    @book
  end
    
  test "book publication year" do
    ok = [2020, 1800, 0, "", nil]
    bad = ["String"]
    
    ok.each do |year|
      assert new_book(year).valid?,
      "#{year} should be invalid"
    end
    
    bad.each do |year|
      assert new_book(year).invalid?,
      "#{year} shouldn't be valid"
    end
  end

  test "default images" do
    @book = books(:genericBook)
    assert_not @book.image.attached?
    @book.image.attach(io: File.open("./storage/seed-and-default-images/default-image.png"), filename: 'default-image.png')
    @book.save
    assert @book.image.attached?
    assert @book.valid?
  end
end
