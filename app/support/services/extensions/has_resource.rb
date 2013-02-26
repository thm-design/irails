module Services
  module Extensions
    module HasResource
      extend ActiveSupport::Concern

      included do
        class_attribute :resource_name
      end

      def resource_name
        self.class.resource_name
      end

      def resource_attributes
        filter_attributes(dirty_resource_attributes)
      end

      def resource_class
        resource_name.classify.constantize
      end

      def build_resource(attributes = {})
        resource_class.new(default_resource_attributes.merge(attributes))
      end

      def find_resource(id)
        resource_class.find(id)
      end

      module ClassMethods
        def resource(name)
          self.resource_name = name.to_s
        end
      end

      private
        def dirty_resource_attributes
          params[resource_name]
        end

        def default_resource_attributes
          {}
        end

        def filter_attributes(attributes)
          attributes
        end
    end
  end
end
