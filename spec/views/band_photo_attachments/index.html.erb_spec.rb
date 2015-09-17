require 'rails_helper'

RSpec.describe "band_photo_attachments/index", type: :view do
  before(:each) do
    assign(:band_photo_attachments, [
      BandPhotoAttachment.create!(
        :band_id => 1,
        :photo => "Photo"
      ),
      BandPhotoAttachment.create!(
        :band_id => 1,
        :photo => "Photo"
      )
    ])
  end

  it "renders a list of band_photo_attachments" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Photo".to_s, :count => 2
  end
end
