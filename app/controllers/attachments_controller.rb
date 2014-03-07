class AttachmentsController < ApplicationController

  def index
    @attachments = Attachment.all
    render :json => @attachments.collect { |a| a.to_jq_upload }.to_json
  end

  def create
    params[:files].each do |file|
      attachment = Attachment.new
      attachment.file = file
      if attachment.save
        respond_to do |format|
          format.html {
            render :json => [attachment.to_jq_upload].to_json,
            :content_type => "text/html",
            :layout => false
          }
          format.json {
            render :json => [attachment.to_jq_upload].to_json
          }
        end
      else
        render :json => [{:error => "custom_failure"}], :status => 304 and return
      end
    end
  end

 def destroy
    @attachment = Attachment.find(params[:id])
    @attachment.destroy
    render :json => true
  end

end