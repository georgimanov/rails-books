Feature: search for books by author

  As a book buff
  So that I can find books with my favorite author
  I want to include and search on author information in books I enter

  Background: books in database

    Given the following books exist:
      | title                   				| genre  				| publish_date |
      | Nineteen Eighty-Four    				| Science fiction   	| 8-Jun-1949   |
      | The Fault in Our Stars  				| Drama     			| 10-Jan-2017  |
      | Harry Potter and the Chamber of Secrets	| Action and adventure	| 2-Jul-1998   |
      | Pride and Prejudice						| Romance  				| 28-Jan-1813  |
      | Murder on the Orient Express			| Mystery  				| 1-Jan-1934   |

  Scenario: add author to existing book
    When I go to the edit page for "Alien"
    And  I fill in "Author" with "Ridley Scott"
    And  I press "Save Changes"
    Then the author of "Alien" should be "Ridley Scott"

  Scenario: find book with same author
    Given I am on the details page for "Star Wars"
    When  I follow "Find Books With Same Author"
    Then  I should be on the Similar Books page for "Star Wars"
    And   I should see "THX-1138"
    But   I should not see "Blade Runner"

  Scenario: can't find similar books if we don't know author (sad path)
    Given I am on the details page for "Alien"
    Then  I should not see "Ridley Scott"
    When  I follow "Find Books With Same Author"
    Then  I should be on the home page
    And   I should see "'Alien' has no author info"