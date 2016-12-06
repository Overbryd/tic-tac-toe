# TicTacToe

* Setup with Bundler `$ bundle`
* Run tests with RSpec `$ rspec spec/tic_tac_toe_spec.rb`
* Use in your code:

```ruby
tic_tac_toe = TicTacToe.new([
  %w[X - O],
  %w[X O -],
  %w[X O -]
])
tic_tac_toe.winner
# => "X"
```
