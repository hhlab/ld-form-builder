module LD
  class Form
    class RDFTranslator
      require "rdf"
      module Vocabulary

        class Checkbox < Item
          @@type  = RDF::Resource.new(BASE + "checkbox")
          @@has_options = @@type + "#has_options"

          class << self
            def type
              return @@type
            end
            def options
              return @@has_options
            end
          end
          
        end
      end
    end
  end
end
