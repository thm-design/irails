class SampleResourcesController < ApplicationController
  before_filter :authenticate_user!

  def index
    respond_with service.read_all
  end

  def new
    respond_with service.build
  end

  def create
    respond_with service.create(service.resource_attributes)
  end

  def edit
    respond_with service.edit
  end

  def update
    respond_with service.update(service.resource_attributes)
  end

  # if using respond_with is not enought, use following way:
  def assign_to_me
    response = service.assign_to_me(params[:id])
    if response.success?
      # do something and
      redirect_to root_url, notice: 'Sample Resource assigned to you'
    else
      set_resource_from(response)
      render :edit
    end
  end

  private
    def service
      @service ||= Services::SampleResources::Base.new(as: current_user, params: params)
    end
end
