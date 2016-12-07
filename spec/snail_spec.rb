require 'spec_helper'

describe "Snail::solve" do

  [
    [
      [
        %w[1 2 3],
        %w[8 9 4],
        %w[7 6 5]
      ],
      %w[1 2 3 4 5 6 7 8 9]
    ],
    [
      [[]], []
    ],
    [
      [
        %w[1 2],
        %w[4 3]
      ],
      %w[1 2 3 4]
    ]
  ].each do |(input, solution)|
    it "should return #{solution} for #{input}" do
      expect(Snail.solve(input)).to eq(solution)
    end
  end

end

