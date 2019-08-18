class ImageAttachmentsController < ApplicationController
  def destroy
    resource_name = params[:resource_name].constantize
    resource_id = params[:resource_id]
    @resource = resource_name.find(resource_id)

    @image = @resource.images.find(params[:id])

    @image.purge

    redirect_back(fallback_location: root_path)
  end
end
