require 'rails_helper'

RSpec.describe "band_photo_attachments/show", type: :view do
  before(:each) do
    @band_photo_attachment = assign(:band_photo_attachment, BandPhotoAttachment.create!(
      :band_id => 1,
      :photo => "Photo"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Photo/)
  end
end
