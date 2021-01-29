module Search
  class InMemory
    module Sorter
      def sort(collection, _query, sort_options = nil)
        return collection if collection.length <= 1
        return collection unless sort_options

        collection.sort do |record_a, record_b|
          a = record_a.with_indifferent_access[sort_options[:field]]
          b = record_b.with_indifferent_access[sort_options[:field]]
          direction = sort_options[:direction]

          next direction == 'asc' ? -1 : 1 if a.nil?
          next direction == 'asc' ? 1 : -1 if b.nil?

          direction == 'asc' ? a <=> b : b <=> a
        end
      end
    end
  end
end
