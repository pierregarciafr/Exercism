=begin
Write your code for the 'Gigasecond' exercise in this file. Make the tests in
`gigasecond_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/gigasecond` directory.
=end
class Gigasecond
  def self.from(date)
    Time.at(date.to_i + 10**9).utc
  end
end
