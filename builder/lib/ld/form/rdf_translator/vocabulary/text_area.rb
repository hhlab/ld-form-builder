module LD
  class Form
    class RDFTranslator
      module Vocabulary
        require "rdf" 
        class TextArea < Item
          @@type = RDF::Resource.new(BASE + "text_area")
          @@min = @@type + "#min_length"
          @@max = @@type + "#max_length"

          class <<  self

            def min_length
              return @@min
            end

            def max_length
              return @@max
            end

          end

        end
      end
    end
  end
end
