Feature: Employee

  Scenario: I login as an employee
    Given that I login as an employee
    Then I should be redirected to the employee.html

  Scenario Outline: I input a customers email while logged in as an employee
    Given that I login as an employee
    When I type in a valid email of "<email>" into set active user
    And I click on the search button in the form set active user
    Then A table should generate with accounts for "<email>"
    Examples:
    |email|
    |jd80@a.ca|
    |jd81@a.ca|

    Scenario: Add savings account to user
      Given that I login as an employee
      When I type in a valid email of "jd80@a.ca" into set active user
      And I click on the search button in the form set active user
      And I click on the savings radio button
      And I click the add account submit button
#      Then a new account should appear

  Scenario: Add checking account to user
    Given that I login as an employee
    When I type in a valid email of "jd80@a.ca" into set active user
    And I click on the search button in the form set active user
    And I click on the checking radio button
    And I click the add account submit button
#      Then a new account should appear

  Scenario Outline: Link Account to user
    Given that I login as an employee
    When I type in a valid email of "jd80@a.ca" into set active user
    And I click on the search button in the form set active user
    And I type in an account number of "<account>"
    And I click on the link account button
#    Then "<account>" should be displayed on the table
    Examples:
    |account|
    |1      |
    |2      |
    |3      |

  Scenario Outline: Unlink first Account from user
    Given that I login as an employee
    When I type in a valid email of "jd80@a.ca" into set active user
    And I click on the search button in the form set active user
    And I select account <accountId> from unlink dropdown
    And I click on the unlink account button
#    Then <accountId> should be removed
    Examples:
    |accountId|
    |1        |
    |1        |
    |1        |

  Scenario: Logout from employee page
    Given that I login as an employee
    When I click on logout on employee page
    Then I should be redirected to the index.html

    Scenario: Access Trx information for an certain account
      Given that I login as an employee
      When I type in a valid email of "jd80@a.ca" into set active user
      And I click on the search button in the form set active user
      And I click on the first account
      And I click back
      Then I should be at the original table on employees

