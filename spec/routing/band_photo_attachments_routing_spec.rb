require "rails_helper"

RSpec.describe BandPhotoAttachmentsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/band_photo_attachments").to route_to("band_photo_attachments#index")
    end

    it "routes to #new" do
      expect(:get => "/band_photo_attachments/new").to route_to("band_photo_attachments#new")
    end

    it "routes to #show" do
      expect(:get => "/band_photo_attachments/1").to route_to("band_photo_attachments#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/band_photo_attachments/1/edit").to route_to("band_photo_attachments#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/band_photo_attachments").to route_to("band_photo_attachments#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/band_photo_attachments/1").to route_to("band_photo_attachments#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/band_photo_attachments/1").to route_to("band_photo_attachments#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/band_photo_attachments/1").to route_to("band_photo_attachments#destroy", :id => "1")
    end

  end
end
