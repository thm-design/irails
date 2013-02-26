class Services::BaseResource < Services::Base
  include Services::Extensions::HasResource

  def read_all
    respond_with build_collection
  end

  def build
    respond_with build_resource
  end

  def create(attributes)
    resource = build_resource(attributes)
    if resource.save
      set_message("#{resource_name.titleize} successfully created")
    else
      add_errors_from(resource)
    end
    respond_with(resource)
  end

  def update(attributes)
    resource = find_resource(params[:id])
    if resource.update_attributes(attributes)
      set_message("#{resource_name.titleize} successfully updated")
    else
      add_errors_from(resource)
    end
    respond_with(resource)
  end
end