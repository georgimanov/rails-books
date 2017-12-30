Feature: User can manually add book

Scenario: Add a book
  Given I am on the MyFavouriteBooks home page
  When I follow "Add book"
  Then I should be on the Create New Book page
  When I fill in "Title" with "Frankenstein"
  And I select "Science fiction" from "Genre"
  And I press "Save Changes"
  Then I should be on the MyFavouriteBooks home page
  And I should see "Frankenstein"