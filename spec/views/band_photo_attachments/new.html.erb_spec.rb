require 'rails_helper'

RSpec.describe "band_photo_attachments/new", type: :view do
  before(:each) do
    assign(:band_photo_attachment, BandPhotoAttachment.new(
      :band_id => 1,
      :photo => "MyString"
    ))
  end

  it "renders new band_photo_attachment form" do
    render

    assert_select "form[action=?][method=?]", band_photo_attachments_path, "post" do

      assert_select "input#band_photo_attachment_band_id[name=?]", "band_photo_attachment[band_id]"

      assert_select "input#band_photo_attachment_photo[name=?]", "band_photo_attachment[photo]"
    end
  end
end
