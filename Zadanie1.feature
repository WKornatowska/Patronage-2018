Feature: Authentication to the application

	As a regular user I want to be able to authenticate to the application
	So that I can see my account details.

	Acceptance criteria:
	- only registered users can authenticate to the application
	- authentication form contains two fields: login and password
	- login field validation: valid email address, up to 60 characters
	(application displays relevant validation messages)
	- error message "Authentication failed. Login or password are
	incorrect." is displayed if authentication process failed (incorrect login,
	password or user is not registered)
	- authenticated user can see account details view:
		- name,
		- surname,
		- email address
		- mailing address

	Scenario: Regular user successfully authenticate to the application
		Given I am an unauthenticated regular user
		And I have a valid user account 
		And I am on the authentication form page
		When I enter valid login and password 
		Then I should be logged user
		And I should have access to the account details view: "name", "surname", "email address", "mailing address"

	Scenario: Regular user failed authenticate to the application
		Given I am an unauthenticated regular user
		And I have a valid user account 
		And I am on the authentication form page
		When I enter invalid login and password 
		Then I should see error message "Authentication failed. Login or password are incorrect."

	Scenario: Unregistered user failed authenticate to the application
		Given I am an unauthenticated regular user
		And I don't have a valid user account 
		And I am on the authentication form page
		When I enter login and password 
		Then I should see error message "Authentication failed. Login or password are incorrect."

	Scenario: Regular user enter email address consisting more than 60 characters in login field 
		Given I am an unauthenticated regular user
		And I am on the authentication form page
		When I fill in "login" with email address consisting more than 60 characters
		Then I should see relevant validation message

	Scenario: Regular user enter invalid format of email address in login field
		Given I am an unauthenticated regular user
		And I am on the authentication form page
		When I fill in "login" with invalid format of email address
		Then I should see relevant validation message
