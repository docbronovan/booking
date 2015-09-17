require 'rails_helper'

RSpec.describe "band_photo_attachments/edit", type: :view do
  before(:each) do
    @band_photo_attachment = assign(:band_photo_attachment, BandPhotoAttachment.create!(
      :band_id => 1,
      :photo => "MyString"
    ))
  end

  it "renders the edit band_photo_attachment form" do
    render

    assert_select "form[action=?][method=?]", band_photo_attachment_path(@band_photo_attachment), "post" do

      assert_select "input#band_photo_attachment_band_id[name=?]", "band_photo_attachment[band_id]"

      assert_select "input#band_photo_attachment_photo[name=?]", "band_photo_attachment[photo]"
    end
  end
end
