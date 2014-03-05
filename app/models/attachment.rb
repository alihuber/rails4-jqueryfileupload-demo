class Attachment < ActiveRecord::Base
  belongs_to :task
  mount_uploader :file, FileUploader


  def to_jq_upload
    {
      "name" => read_attribute(:file),
      "size" => file.size,
      "url" => file.url,
      "thumbnail_url" => file.thumb.url,
      "delete_url" => Rails.application.routes.url_helpers.attachment_path(:id => id),
      "delete_type" => "DELETE"
    }
  end


end

