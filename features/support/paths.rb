module NavigationHelpers

  def path_to(page_name)
    case page_name

      when /^the user profile page$/

      when /^the users listing page/
        users_path
      
    end
  end
end

World(NavigationHelpers)
