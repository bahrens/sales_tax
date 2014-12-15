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
* Assumed that data in the proper ranges will be supplied

#### Design approach and decisions

The current design is geared towards the immediate requirements of this exercise. This design is well-suited for situations where tax rates and import rates do not vary within a shopping basket (however, each item calculates it's own tax and it wouldn't be hard vary from this current restriction). The current design does not enforce the requirements that books, food, and medical products be exempt from taxes. It instead relies on the fact that the calling code will instantiate the `Item` class with the proper values for `tax_exempt` and `imported`. This design would work well for a scenario in which there is a large number exempt and non-exempt products. For example, you could write additional code that reads products from a database, reads the products attributes (tax exempt, imported), and then use those attributes when instantiating the `Item` class.

Before starting to code, I did some research on the appropriate data type to use for currency. This is important because many of the interfaces would expose this data type. Additionally, it would also be important to avoid any issues that could arise with floating point arithmetic. For this reason BigDecimal was chosen.

After coming up with an initial idea for the design, I also decided that a TDD approach would work really well for driving out the design, while also presenting a clear story of how the code evolved from commit to commit.

#### Areas for improvement

The current receipt tests are hard-coded to specific results that not 100% controlled by the tests. The test relies on classes that contain logic for computing taxes. This means that changes to the underlying tax calculation, etc. will break the receipt tests making them a little bit fragile. There are a few alternatives for solving this problem. First, one could use stubs / mocks in the tests. Another solution could be to refactor the design so that the receipt logic only depends on a data structure (a class with only data, no behavior).

When printing the receipt, I was not able to find a way to have the BigDecimal convert to a string with 2 decimal places without some custom logic. Being new to Ruby, I wasn't sure if I was missing a way to do this. I would possibly spend a little more time researching this to see if there is a simple solution for this.

There is also no validation of input data to ensure that they are in proper ranges (for example, non-negative prices). The code could be modififed to support this as well as additional test cases.

#### Some Alternative Designs

1. Subtypes for each type of good 
2. Rule / strategy / lookup for each type of good

Subtypes / inheritance could work for this small example, but would not work great with a data driven solution (a large set products stored somewhere, that could change frequently). A rule / strategy approach would suffer from similar problems as the inheritance approach and would be unnecessarily complex.
