module NavigationHelpers
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'
	when /^the MyFavouriteBooks home page/ 
      '/books'
  when /^the edit page for "([^"]+)"$/
    edit_book_path(Book.find_by_title($1).id)
  when /^the details page for "(.*)"/
    book_path(Book.find_by_title $1)
	when /^the Create New Book page/
      '/books/new'
    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
