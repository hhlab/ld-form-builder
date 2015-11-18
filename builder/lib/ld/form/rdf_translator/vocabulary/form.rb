module LD
  class Form
    class RDFTranslator
      require "rdf"
      module Vocabulary
        class Form
          @@type  = RDF::Resource.new(BASE + "form")
          @@has_options = @@type + "#has_options"
          @@has_items = @@type + "#has_items"
          
          class << self
            def type
              return @@type
            end
            def options
              return @@has_options
            end
            def items
              return @@has_items
            end
          end

        end
      end
    end
  end
end
