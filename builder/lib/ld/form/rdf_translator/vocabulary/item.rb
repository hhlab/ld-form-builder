module LD
  class Form
    class RDFTranslator
      require "rdf"
      require "rdf/vocab"
      module Vocabulary
        class Item
          @@type  = RDF::Resource.new(BASE + "item")
          @@title = RDF::Vocab::DC.title
          @@parent = @@type + "#parent"
          
          class << self
            def type
              return @@type
            end
            def title
              return @@title
            end
            def parent
              return @@parent
            end
          end

        end
      end
    end
  end
end
