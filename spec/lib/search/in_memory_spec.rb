require 'rails_helper'
require 'lib/search/in_memory/shared_examples/matcher'
require 'lib/search/in_memory/shared_examples/highlighter'
require 'lib/search/in_memory/shared_examples/sorter'
require 'lib/search/in_memory/shared_examples/scorer'

RSpec.describe Search::InMemory do
  it_behaves_like Search::InMemory::Matcher
  it_behaves_like Search::InMemory::Highlighter
  it_behaves_like Search::InMemory::Sorter
  it_behaves_like Search::InMemory::Scorer

  # combines all
  # describe '.search' do
  #   subject { instance.search(collection, query) }

  #   let(:collection) { [] }
  #   let(:query) { '' }
  #   let(:instance) { described_class.new }

  # end
end
