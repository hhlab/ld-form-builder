module LD
  class Form
    module OptionManagable

      def options(*new_options)
        new_options = new_options.flatten
        new_options.each{|i|
          if i.is_a?(Set)
            self.options(i.to_a)
          else
            self.option(i)
          end
        }
        return @options
      end

      def option(new_option=nil)
        new_option = LD::Form::Option.new(new_option) if new_option.is_a?(String)
        
        if new_option.is_a?(LD::Form::Option)
          @options.add(new_option)
          new_option.add_parent(self)
        end
        return @options
      end

    end
  end
end
