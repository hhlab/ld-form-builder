module LD
  class Form
    class RDFTranslator
      require "rdf"
      module Vocabulary
        class Option
          @@type  = RDF::Resource.new(BASE + "option")
          @@refered_from = @@type + "#refered_from"
          
          class << self
            def type
              return @@type
            end
            def refered_from
              return @@refered_from
            end
          end

        end
      end
    end
  end
end
