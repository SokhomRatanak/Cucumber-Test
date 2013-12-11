Feature: Home page
        In order to get information from website
        As the website user
        I want to go to homepage

        Scenario: Home page is available

        Given I am on "homepage"
	Then I should see "Home"
	And I should see "News"
	And I should see "Who We Are"

