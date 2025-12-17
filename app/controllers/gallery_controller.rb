class GalleryController < ApplicationController
  allow_unauthenticated_access only: %i[index]
  
  def index
    @photos = ActiveStorage::Attachment.joins(:blob)
      .where.not(record_type: 'Promo')
      .where("active_storage_blobs.content_type LIKE ?", "image/%")
  end
end
