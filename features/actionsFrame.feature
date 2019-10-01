Feature: Frames


Scenario: Frame

Given I am on shitest
When click on frames
And clic both link test on frames
Then i validate the title "Link Test"


Scenario: IFrame

Given I am on shitest
When click on iframes
And clic test on iframes
Then i validate the title "Link Test"

