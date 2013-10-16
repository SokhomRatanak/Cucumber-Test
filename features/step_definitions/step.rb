Given(/^I am on "(.*?)"$/) do |page_name|
   visit path_to(page_name)
  [404,500,403].should_not include(page.status_code)
end
Then(/^I take a screenshot$/) do
   # The class variables are set in support/hooks.rb
  counter   = @screenshot_counter.to_s.rjust(2, '0')
  file_name = @scenario.name.downcase.tr(" ", "_").gsub(/[^\w_\.\-]+/,"")
  page.driver.render("screenshot_#{file_name}_#{counter}.png", :full => true)
  @screenshot_counter += 1
end
Then(/^I should see "(.*?)"$/) do |text|
  page.should have_content(text)
end

And(/^I should see "(.*?)" within "(.*?)"$/) do |regexp, selector|
  regexp = Regexp.new(regexp)
  with_scope(selector) do
    page.should have_xpath('//*', :text => regexp)
  end
end

When(/^I submit the form "(.*?)"$/) do |form_id| 
    page.execute_script("$('form##{form_id}').submit();")
#	submit_form 'form_id'
end
When(/^I wait for (\d+) seconds$/) do |seconds|
    sleep seconds.to_i 
end
When(/^I fill in "(.*?)" with "(.*?)"$/) do |field, value|
    fill_in(field, :with => value) 
end



When(/^I search for "(.*?)" within "(.*?)"$/) do |value, selector|
  with_scope(selector) do
    fill_in('tx_indexedsearch[sword]', :with => value)
  end
end
Then(/^I press "(.*?)"$/) do |link|
   click_button(link)
end







