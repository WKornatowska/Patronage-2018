Feature: Authentication to the application

	As a regular user I want to be able to authenticate to the application
	So that I can see my account details.

	Background:
		Given I am on the authentication form page
		And I am an unauthenticated regular user
		
	Scenario: Regular user successfully authenticate to the application
		Given I have a valid user account 
		When I enter valid login "validEmail@test.com" and password "validPassword"
		Then I should be logged user
		And I should have access to the account details view: "name", "surname", "email address", "mailing address"

	Scenario Outline: Regular user failed authenticate to the application
		Given I have a valid user account 
		When I enter invalid login <email> and  password <password>
		Then I should see error message "Authentication failed. Login or password are incorrect."
	Examples:
		|	   email       |    password      |
		| validEmail@test.com  |  invalidPassword | 
		| invalidEmail@test.com|  validPassword   |
		| invalidEmail@test.com|  invalidPassword |

	Scenario: Unregistered user failed authenticate to the application
		Given I don't have a valid user account 
		When I enter login "newUser@test.com" and password "newPassword"
		Then I should see error message "Authentication failed. Login or password are incorrect."

	Scenario Outline: Regular user enter email address with incorrect number of characters
		When I fill in "login" with <email> 
		Then I should see <validation_message>
		Examples:
		| email  						       |  validation_message	   |
		|testtesttesttesttesttesttesttesttesttesttesttesttest@test.com |relevant validation message| #email address consist 61 characters
		|testtesttesttesttesttesttesttesttesttesttesttesttes@test.com  |			   | #email address consist 60 characters
		|testtesttesttesttesttesttesttesttesttesttesttestte@test.com   |		           | #email address consist 59 characters
	
	Scenario Outline: Regular user enter invalid format of email address in login field
		When I fill in "login" with invalid format of email address <email>
		Then I should see relevant validation message <validation_message>
	Examples:
	| email  		|  validation_message       |
	|   @	 		|relevant validation message|
	|   @t   	        |relevant validation message|
	|   t@   	        |relevant validation message|
	|   t@t 		|relevant validation message|
	|   t@t. 	        |relevant validation message|
	|   test@test.com       |			    |
		
	
