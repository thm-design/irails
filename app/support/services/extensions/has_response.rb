module Services
  module Extensions
    module HasResponse
      def errors
        @errors ||= []
      end

      def add_error(error)
        errors << error
      end

      def add_error_unless(error, condition)
        add_error(error) unless condition
      end

      def add_errors_from(resource)
        @errors += resource.errors
      end

      def respond_with(result)
        Services::Response.new(result).with_message(message).and_errors(errors)
      end
    end
  end
end
