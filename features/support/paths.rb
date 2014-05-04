module NavigationHelpers

  def path_to(page_name, options = {})
    case page_name
      when /^the Login Page$/
        
      when /^the signup page$/
        signup_path
      when /^the users listing page/
        users_path
      when /^my profile page$/
        if options.has_key?("current_user")
          "/users/" + options["current_user"].id.to_s
        end
      when /^my friends list$/
        if options.has_key?("current_user")
          "/users/" + options["current_user"].id.to_s + "/relationships"
        end
      when /^profile page for user$/
        if options.has_key?("user")
          "/users/" + options["user"].id.to_s
        end
    end
  end
end

World(NavigationHelpers)
