module LD
  class Form
    class RDFTranslator
      module Vocabulary
        require "rdf"
        class NumberField < Item
          @@type = RDF::Resource.new(BASE + "number_field")
          @@min = @@type + "#min"
          @@max = @@type + "#max"
          @@base = @@type + "#base"

          class <<  self

            def base
              return @@base
            end

            def min
              return @@min
            end

            def max
              return @@max
            end

          end

        end
      end
    end
  end
end
