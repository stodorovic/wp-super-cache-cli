Feature: Generate cache

  Scenario: Manage wp-super-cache via cli
    Given a WP install

    When I run `wp plugin install wp-super-cache`
    Then STDOUT should contain:
      """
      Downloading install
      """
    And STDOUT should contain:
      """
      Plugin installed successfully.
      """
    And the wp-content/plugins/wp-super-cache directory should exist

    When I try `wp super-cache enable`
    Then STDERR should contain:
      """
      Error: 'super-cache' is not a registered wp command. See 'wp help' for available commands.
      """

    When I run `wp package install https://github.com/wojsmol/wp-super-cache-cli/archive/tov2.zip
    Then STDOUT should contain:
      """
      Success: Package installed.
      """

     When I run `wp super-cache enable`
     Then STDOUT should contain:
      """
      Success: The WP Super Cache is enabled.
      """
