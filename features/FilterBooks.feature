Feature: display list of books filtered by Romance genre
 
  As a concerned parent
  So that I can quickly browse books appropriate for my girlfriend
  I want to see books matching only certain Romance genre

Background: books have been added to database

  Given the following books exist:
  | title                   				| genre  				| publish_date |
  | Nineteen Eighty-Four    				| Science fiction   	| 8-Jun-1949   |
  | The Fault in Our Stars  				| Drama     			| 10-Jan-2017  |
  | Harry Potter and the Chamber of Secrets	| Action and adventure	| 2-Jul-1998   |
  | Pride and Prejudice						| Romance  				| 28-Jan-1813  |
  | Murder on the Orient Express			| Mystery  				| 1-Jan-1934   |

  And  I am on the MyFavouriteBooks home page
  Then 5 seed books should exist

Scenario: restrict to books with 'Drama' or 'Romance' genre
  When I check the following genres: Drama, Romance
  And  I uncheck the following genres: Horror
  And  I press "Selected only"

  Then I should see "The Fault in Our Stars"
  And  I should see "Pride and Prejudice"

  And  I should not see "Nineteen Eighty-Four"
  And  I should not see "Harry Potter and the Chamber of Secrets"
  And  I should not see "Murder on the Orient Express"

  
Scenario: all genres visible
  When I follow "View all books"
  Then I should be on the MyFavouriteBooks home page
  Then I should see all the books

  
Scenario: all genres selected
  When I check the following genres: Science_fiction, Drama, Romance, Mystery, Horror, Action_and_adventure
  And  I press "Selected only"
  Then I should see all the books