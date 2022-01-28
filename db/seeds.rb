Book.delete_all
Book.create! do |book|
  book.title = 'Belgian Fairy Tales'
  book.language = 'English'
  book.author = 'Griffis, William Elliot'
  book.published = 1919
  book.excerpt = 'We Americans ought to know who the Walloons are; 
    for, in 1624, some of these people—even before the Dutch 
    mothers and fathers, boys and girls came—settled New York 
    and New Jersey. It was they who introduced on our soil the 
    marguerite, or white-and-yellow daisy, and they were the 
    first farmers in the Middle States. Moreover, when New 
    Netherland received a civil government, it was named Nova 
    Belgica, or New Belgium.'
  book.image.attach(io: File.open("./storage/default-images/belgiam-fairy-tales.jpg"), filename: 'belgiam-fairy-tales.jpg')
  book.save # will cause the blob path to update
  book.image_url = Rails.application.routes.url_helpers.rails_blob_path(book.image, only_path: true)
  # the create method will save the new record into the database
end
# . . .
Book.create! do |book|
  book.title = 'Alice’s Adventures in Wonderland'
  book.language = 'English'
  book.author = 'Lewis Carol'
  book.published = 1865
  book.excerpt = 'The rabbit-hole went straight on like a tunnel for some way, 
  and then dipped suddenly down, so suddenly that Alice had not a moment to 
  think about stopping herself before she found herself falling down a very 
  deep well.'
  book.image.attach(io: File.open("./storage/default-images/alice-in-wonderland.jpg"), filename: 'alice-in-wonderland.jpg')
  book.save
  book.image_url = Rails.application.routes.url_helpers.rails_blob_path(book.image, only_path: true)
end
# . . .
Book.create! do |book|
  book.title = 'Great Expectations'
  book.language = 'English'
  book.author = 'Charles Dickens'
  book.published = 1867
  book.excerpt = 'What a questioner he is. Ask no questions, and you’ll be told no lies.'
  book.image.attach(io: File.open("./storage/default-images/great-expectations.jpg"), filename: 'great-expectations.jpg')
  book.save
  book.image_url = Rails.application.routes.url_helpers.rails_blob_path(book.image, only_path: true)
end
# . . .
Book.create! do |book|
  book.title = 'The Strange Case Of Dr. Jekyll And Mr. Hyde'
  book.language = 'English'
  book.author = 'Robert Louis Stevenson'
  book.published = 1886
  book.excerpt = 'From that time forward, Mr. Utterson began to haunt the 
  door in the by-street of shops. In the morning before office hours, at 
  noon when business was plenty and time scarce, at night under the face 
  of the fogged city moon, by all lights and at all hours of solitude or 
  concourse, the lawyer was to be found on his chosen post. If he be Mr. Hyde, 
  he had thought, I shall be Mr. Seek.'
  book.image.attach(io: File.open("./storage/default-images/jekyll-hyde.jpg"), filename: 'jekyll-hyde.jpg')
  book.save
  book.image_url = Rails.application.routes.url_helpers.rails_blob_path(book.image, only_path: true)
end