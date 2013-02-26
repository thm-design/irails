class Services::SampleResources::Base < Services::BaseResource
  resource :sample_resource

  private
    def resource_class
      OpenStruct
    end

    def build_collection
      [build_resource]
      # or something like User.all
    end
end