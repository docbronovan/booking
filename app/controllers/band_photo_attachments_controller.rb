class BandPhotoAttachmentsController < ApplicationController
  before_action :set_band_photo_attachment, only: [:show, :edit, :update, :destroy]

  # GET /band_photo_attachments
  # GET /band_photo_attachments.json
  def index
    @band_photo_attachments = BandPhotoAttachment.all
  end

  # GET /band_photo_attachments/1
  # GET /band_photo_attachments/1.json
  def show
  end

  # GET /band_photo_attachments/new
  def new
    @band_photo_attachment = BandPhotoAttachment.new
  end

  # GET /band_photo_attachments/1/edit
  def edit
  end

  # POST /band_photo_attachments
  # POST /band_photo_attachments.json
  def create
    @band_photo_attachment = BandPhotoAttachment.new(band_photo_attachment_params)

    respond_to do |format|
      if @band_photo_attachment.save
        format.html { redirect_to @band_photo_attachment, notice: 'Band photo attachment was successfully created.' }
        format.json { render :show, status: :created, location: @band_photo_attachment }
      else
        format.html { render :new }
        format.json { render json: @band_photo_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /band_photo_attachments/1
  # PATCH/PUT /band_photo_attachments/1.json
  def update
  respond_to do |format|
    if @band_photo_attachment.update(band_photo_attachment_params)
      format.html { redirect_to @band_photo_attachment.post, notice: 'Band attachment was successfully updated.' }
    end 
  end
  end

  # DELETE /band_photo_attachments/1
  # DELETE /band_photo_attachments/1.json
  def destroy
    @band_photo_attachment.destroy
    respond_to do |format|
      format.html { redirect_to band_photo_attachments_url, notice: 'Band photo attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_band_photo_attachment
      @band_photo_attachment = BandPhotoAttachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def band_photo_attachment_params
      params.require(:band_photo_attachment).permit(:band_id, :photo)
    end
end
