books = [
    {:title => 'Nineteen Eighty-Four', :publish_date => '8/6/1949', :genre => 'Science fiction', :description => 'Nineteen Eighty-Four, often published as 1984, is a dystopian novel published in 1949 by English author George Orwell. The novel is set in Airstrip One, formerly Great Britain, a province of the superstate Oceania.', :isbn_number => '9780451518651'},
    {:title => 'The Fault in Our Stars', :publish_date => '10/1/2017', :genre => 'Drama', :description => 'The Fault in Our Stars is the sixth novel by author John Green, published in January 2012. The title is inspired by Act 1, Scene 2 of Shakespeare\'s play Julius Caesar, in which the nobleman Cassius says ...', :isbn_number => '3780454518651'},
    {:title => 'Harry Potter and the Chamber of Secrets', :publish_date => '2/7/1998', :genre => 'Action and Adventure', :description => 'Harry Potter and the Chamber of Secrets is a fantasy novel written by British author J. K. Rowling and the second novel in the Harry Potter series.', :isbn_number => '0-7475-3849-2'},
    {:title => 'Pride and Prejudice', :publish_date => '28/1/1813', :genre => 'Romance', :description => 'Pride and Prejudice is a romance novel by Jane Austen, first published in 1813. The story charts the emotional development of the protagonist, Elizabeth Bennet, who learns the error of making hasty ...', :isbn_number => '4780454518654'},
    {:title => 'Murder on the Orient Express', :publish_date => '1/1/1934', :genre => 'Mystery', :description => 'Murder on the Orient Express is a detective novel by Agatha Christie featuring the Belgian detective Hercule Poirot.', :isbn_number => '5780455518655'}
]

books.each do |book|
  Book.create!(book)
end
