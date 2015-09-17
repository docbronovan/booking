json.array!(@band_photo_attachments) do |band_photo_attachment|
  json.extract! band_photo_attachment, :id, :band_id, :photo
  json.url band_photo_attachment_url(band_photo_attachment, format: :json)
end
