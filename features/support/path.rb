# Use this file to convert URL to more human readable page names.
# Example: The word 'homepage' will always be translated to the root domain.
# The root page is defined in the environment variable CUCUMBER_HOST
module NavigationHelpers
  def path_to(page_name)
    case page_name
      when /homepage/
        ENV['CUCUMBER_HOST']
      else
        ENV['CUCUMBER_HOST'] + page_name
      end
    end
end

World(NavigationHelpers)
