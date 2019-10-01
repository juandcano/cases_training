
Feature: Selects


Scenario: Selectors

Given I am on shitest
When click on select test 
And select option 
Then validate option selected "    With spaces"

Scenario: Selector I

Given I am on shitest
When click on select test 
And select option "Cell Phone" 