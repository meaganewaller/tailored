require "test_helper"

class BulkUploadProcessingJobTest < ActiveJob::TestCase
  setup do
    @wardrobe_item = wardrobe_items(:one)

    # Create a blob (simulating an uploaded image)
    @image_blob = ActiveStorage::Blob.create_and_upload!(
      io: File.open(Rails.root.join("test/fixtures/files/test_image.jpg")),
      filename: "test_image.jpg",
      content_type: "image/jpeg"
    )

    # Attach the blob to the wardrobe item
    @wardrobe_item.images.attach(@image_blob)

    @image_key = @wardrobe_item.images.first.blob.key
    @job = BulkUploadProcessingJob.new
  end

  # test "should tag image and update colors" do
  #   # Mock the Google Vision API label and color detection
  #   mock_vision_label_response = mock()
  #   mock_vision_color_response = mock()

  #   mock_vision_label_response.stubs(:label_annotations).returns([
  #     OpenStruct.new(description: "dress", score: 0.95),
  #     OpenStruct.new(description: "sleeve", score: 0.90)
  #   ])

  #   mock_vision_color_response.stubs(:responses).returns([
  #     OpenStruct.new(image_properties_annotation: OpenStruct.new(dominant_colors: OpenStruct.new(colors: [
  #       OpenStruct.new(color: OpenStruct.new(red: 255, green: 0, blue: 0), score: 0.8)
  #     ])))
  #   ])

  #   Google::Cloud::Vision.stub_any_instance(:label_detection, mock_vision_label_response) do
  #     Google::Cloud::Vision.stub_any_instance(:image_properties_detection, mock_vision_color_response) do

  #       perform_enqueued_jobs do
  #         BulkUploadProcessingJob.perform_now(@wardrobe_item.id, "WardrobeItem", @image_key)
  #       end

  #       @wardrobe_item.reload

  #       # Verify tags and colors were updated
  #       assert_includes @wardrobe_item.tags, "dress"
  #       assert_includes @wardrobe_item.tags, "sleeve"
  #       assert_equal @wardrobe_item.colors, [{ "score" => 0.8, "hex" => "#ff0000" }]
  #     end
  #   end
  # end

  test "should not process if image is not attached" do
    @wardrobe_item.images.purge
    assert_no_enqueued_jobs do
      BulkUploadProcessingJob.perform_now(@wardrobe_item.id, "WardrobeItem", @image_key)
    end
  end

  # test "should handle when Google Vision returns no results" do
  #   # Mock empty response from Google Vision
  #   mock_empty_response = mock()
  #   mock_empty_response.stubs(:label_annotations).returns([])
  #   mock_empty_response.stubs(:responses).returns([])

  #   Google::Cloud::Vision.stub_any_instance(:label_detection, mock_empty_response) do
  #     Google::Cloud::Vision.stub_any_instance(:image_properties_detection, mock_empty_response) do

  #       perform_enqueued_jobs do
  #         BulkUploadProcessingJob.perform_now(@wardrobe_item.id, "WardrobeItem", @image_key)
  #       end

  #       @wardrobe_item.reload

  #       # Verify no tags or colors are set
  #       assert_empty @wardrobe_item.tags
  #       assert_equal({}, @wardrobe_item.colors)
  #     end
  #   end
  # end
end
