module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name, resource=nil)
    case page_name

    when /^the home\s?page$/
      root_path

    when /^the dashboard page$/
      dashboard_path

    when /^the login page$/
      new_user_session_path

    when /^the posts list page$/
      posts_path
    when /^the post page$/
      post_path(resource)
    when /^the new post page$/
      new_post_path
    when /^the edit post page$/
      edit_post_path(resource)

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

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
