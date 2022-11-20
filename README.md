# takeaway

## Solo Project 

As part of the first two weeks of the Makers Bootcamp, we have been working 
through a sequence of exercises and challenges with the following objectives:

* Learn to test-drive programs with multiple classes.
* Learn to break programs up into classes.
* Learn to debug your programs.
* Learn to build software as a pair.
* Learn to explain why test-driving, object-oriented design, debugging, 
  and pairing are powerful practices for software engineers.

At the end of the modeule, we have been assigned this solo project that has been 
designed to test all of our skills.

## User Story

> As a customer  
> So that I can check if I want to order something  
> I would like to see a list of dishes with prices.
> 
> As a customer  
> So that I can order the meal I want  
> I would like to be able to select some number of several available dishes.
> 
> As a customer  
> So that I can verify that my order is correct  
> I would like to see an itemised receipt with a grand total.

Use the `twilio-ruby` gem to implement this next one. You will need to use
doubles too.

> As a customer  
> So that I am reassured that my order will be delivered on time  
> I would like to receive a text such as "Thank you! Your order was placed and
> will be delivered before 18:52" after I have ordered.

Fair warning: if you push your Twilio API Key to a public Github repository,
anyone will be able to see and use it. What are the security implications of
that? How will you keep that information out of your repository?

## Approach

* Object-Oriented Design: Designed mutli class system and tests in
 <a href="doc:takeaway_design_recipe.md" target="_blank">takeaway_design_recipe.md</a>
* Test-driving using RSpec: Green on all integration and unit tests (inc. doubles) 
* Used `twilio-ruby` to send a SMS: Using environment variables
* Debugging: Using debugging techniques and error message info.
* Version control: Git and Github
* Language: Ruby

## Further considerations

* Unit Testing API Requests (e.g. `twilio-ruby`)
* Refine class design
* Opportunity to add further conditions as well as greater functionality
  (e.g. Phone Number input and formatter)




