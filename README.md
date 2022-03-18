# Auto Terms and Conditions Generator (terms_conditions_generator)
  - Terms and Condition 

Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

* Installing
  - Ruby version 3.0.0
  - rvm install 2.5.3

* Clone the repository
  - git clone https://github.com/eng-awais/terms_conditions_generator.git
  - cd terms_conditions_generator

* Install Gems
  - bundle install

* How to run the test suite
  - rspec

* How to run the rubocop
  - rubocop

* Execution
  - ruby terms_generator.rb

* Gems and plugins
  - Used rspec gem for test coverage
  - Used pry for dubugging
  - Used rubocop as a linter

* Workflow and functionality
  - User can incorporate the CLAUSE and SECTION in template by running the single script.
  - User can change the template by following the same conventions that we've currently in our template and dataset document. 

* Time Spent: 
  - I've spent the 5 hours and 40 minutes to get this work done. I had a very busy schedule that's why I was not able to start it earlier. 

  - If I've given a more time I can implement the exception handler to cover all the possible exceptions. Currently I've implemented to consider the 
    present files data pattern but I can also implement it in multiple and better ways. I was also thinking If we get the file names from user on run time
    by implement the ARGV-the command line arguments of a Ruby program. We can also generate multiple output files of different templates and datasets. 
    We can perform sorting and code optimizations to get the best asymptotic analysis results.
