module Search
  class InMemory
    include Matcher
    include Highlighter
    include Sorter
    include Scorer
    include Faceter

    def search(records, query, options = {})
      query_string = remove_stop_words(query)
      results = records.map(&:with_indifferent_access)

      results = match(results, query_string)
      results = highlight(results, query_string)
      results = score(results, query_string, options[:weights]) if options[:with_score]
      results = sort(results, query_string, options[:sort]) if options[:sort]

      results
    end

    private

    def remove_stop_words(str)
      str.gsub(/\b(the|a|an|of|to)\b/, '')
    end
  end
end
