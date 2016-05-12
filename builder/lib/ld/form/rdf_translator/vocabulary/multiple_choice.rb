module LD
  class Form
    class RDFTranslator
      require "rdf"
      module Vocabulary
        class MultipleChoice < Checkbox
          @@type  = RDF::Resource.new(BASE + "multiple_choice")
        end
      end
    end
  end
end
