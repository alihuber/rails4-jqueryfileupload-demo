class AttachmentsController < ApplicationController

  def index
    @attachments = Attachment.all
    render :json => @attachments.collect { |a| a.to_jq_upload }.to_json
  end

  def create
    # params:
    #
    # => {"utf8"=>"✓",
    #  "authenticity_token"=>"x9EVMOtp6KZkP6zuqc1SA4/7k+naTDnTWCacqbQw5yg=",
    #  "task"=>{"title"=>"", "description"=>""},
    #  "files"=>
    #   [#<ActionDispatch::Http::UploadedFile:0x00000005d9b188
    #     @content_type="image/jpeg",
    #     @headers=
    #      "Content-Disposition: form-data; name=\"files[]\"; filename=\"avt.jpg\"\r\nContent-Type: image/jpeg\r\n",
    #     @original_filename="avt.jpg",
    #     @tempfile=#<File:/tmp/RackMultipart20140306-9274-1h4wuga>>],
    #  "action"=>"create",
    #  "controller"=>"attachments"}
    if @attachment.save
      respond_to do |format|
        format.html {
          render :json => [@attachment.to_jq_upload].to_json,
          :content_type => "text/html",
          :layout => false
        }
        format.json {
          render :json => [@attachment.to_jq_upload].to_json
        }
      end
    else
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

 def destroy
    @attachment = Attachment.find(params[:id])
    @attachment.destroy
    render :json => true
  end

end
