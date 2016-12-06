require 'rspec'
require_relative "../lib/tic_tac_toe.rb"

RSpec.configure { |c| c.color = true }

describe TicTacToe do

  describe "::parse" do
    let(:input) { "X--OXO-OX" }
    let(:subject) { TicTacToe.parse(input) }

    it { expect(subject).to be_kind_of(TicTacToe) }

    it "should parse a new board from valid input" do
      expect(subject.board).to eq([
        %w[X - -],
        %w[O X O],
        %w[- O X]
      ])
    end

    context "too short input" do
      let(:input) { "X--OXO-" }
      it { expect{subject}.to raise_error(ArgumentError) }
    end

    context "invalid characters" do
      let(:input) { "bogus" }
      it { expect{subject}.to raise_error(ArgumentError) }
    end
  end

  describe "#winner" do
    [
      ["X", [
        %w[X - -],
        %w[O X O],
        %w[- O X]
      ]],
      ["X", [
        %w[X - -],
        %w[X - O],
        %w[X O O]
      ]],
      ["O", [
        %w[- - -],
        %w[O O O],
        %w[X X -]
      ]],
      [nil, [
        %w[- - -],
        %w[- - -],
        %w[- - -]
      ]],
      [nil, [
        %w[X O X],
        %w[O O X],
        %w[X X O]
      ]]
    ].each do |(winner, board)|
      it "should appoint #{winner} to winner for #{board}" do
        tic_tac_toe = TicTacToe.new(board)
        expect(tic_tac_toe.winner).to eq(winner)
      end
    end
  end

end
