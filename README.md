### Sales Tax

Problem definition can be found [here](https://github.com/bahrens/sales_tax/wiki/Sales-Tax-Problem)

#### Requirements

* Tested with Ruby version 2.1.2
* Rake

#### Running the tests

`$ rake`

#### Running the test scenarios as an executable

`ruby -Ilib ./bin/receipt_example`

#### Assumptions

* Assumed that tax rates don't need to change after basket creation
* Assumed that all items in the shopping basket utilize the same tax rate and import rate
* Assumed that testing on the given input was sufficient to be considered a complete solution
* Assumed that since item quantity was 1 for each item in test data, that it didn't have to be a supported feature
* Assumed that duplicate items did not have to be prevented from being added to shopping basket

#### Design approach and decisions

The current design is geared towards the immediate requirements of this exercise. This design is well-suited for situations where tax rates and import rates do not vary within a shopping basket. The current design does not enforce the requirements that books, food, and medical products be exempt from taxes. It instead relies on the fact that this will be "data-driven" when the items are instantiated. This would work well in a real-world scenario when there is a large number exempt and non-exempt products because it prevents the need from modifying the code with every new addition / deletion of products or change to a product's tax requirements.

Before starting to code, I did some research on the appropriate data type to use for currency. This would be important since many of the interfaces would be exposing this data type and to also avoid any issues calculating / rounding currency (as could happen with the float data type). For this reason BigDecimal was chosen.

After coming up with an initial idea for the design, I also decided that TDD approach would work reall well for driving out the design, and also show a clear story of how the code evolved from commit to commit.

#### Areas for improvement

The current receipt tests are hard-coded which is only problematic since the receipt class relies on other collaborators that encapsulate behavior. This means that changes to the underlying tax calculation, etc. will break the receipt tests making them a little bit fragile. There are a few alternatives for solving this problem. First, one could use stubs / mocks in the tests. Another solution could be to refactor the design so that the receipt logic only depends on a data structure.

When printing the receipt, I was not able to find a way to have the BigDecimal convert to a string with 2 decimal places without some custom logic. Being new to Ruby, I wasn't sure if I was missing a way to do this. I would possibly spend a little more time researching this to see if there is a simple solution for this.

#### Some Alternative Designs

1. Subtypes for each type of good 
2. Rule / strategy / lookup for each type of good

Subtypes / inheritance could work for this small example, but would not work great with a data driven solution. A rule / strategy approach would work a little better than the inheritance approach but would be a little unnecessarily complex.
