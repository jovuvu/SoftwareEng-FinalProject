module NavigationHelpers

  def path_to(page_name, options = {})
    case page_name

      when /^the signup page$/
        signup_path
      when /^the users listing page/
        users_path
      when /^my profile page$/
        if options.has_key?("current_user")
          
          "/users/" + options["current_user"].id.to_s
        end
      
    end
  end
end

World(NavigationHelpers)
