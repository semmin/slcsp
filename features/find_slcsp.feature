Feature: Find SLCSP
  In order to find SLCSP for every zip in slcsp.csv
  As a CLI
  I want to run command

  Scenario: Configuring
    When I run `slcsp configure`
    Then the output should contain "configured zips file path to"

  Scenario: Indexing
    When I run `slcsp index`
    Then the output should contain "Started indexing zips file..."

  Scenario: Finding SLCSP
    When I run `slcsp match`
    Then the output should contain "64148,421.43"
