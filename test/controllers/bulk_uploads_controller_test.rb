require "test_helper"

class BulkUploadsControllerTest < ActionDispatch::IntegrationTest
  include ActiveJob::TestHelper

  setup do
    sign_in users(:one)
  end

  test "should render a bulk upload wardrobe_items form" do
    get bulk_upload_wardrobe_items_path
    assert_response :success
  end

  test "should create wardrobe items and enqueue background jobs" do
    image_file = fixture_file_upload(Rails.root.join('test', 'fixtures', 'files', 'test_image.jpg'), 'image/jpeg')

    assert_difference -> { WardrobeItem.count }, 1 do
      assert_enqueued_jobs 1, only: BulkUploadProcessingJob do
        post bulk_upload_wardrobe_items_path, params: { images: [image_file] }
      end
    end

    assert_redirected_to wardrobe_items_path
    assert_equal "Your wardrobe items are being processed. You will be notified when complete.", flash[:notice]
  end

  test "should handle multiple image uploads and enqueue multiple jobs" do
    image_file1 = fixture_file_upload(Rails.root.join('test', 'fixtures', 'files', 'test_image.jpg'), 'image/jpeg')
    image_file2 = fixture_file_upload(Rails.root.join('test', 'fixtures', 'files', 'test_image_2.jpg'), 'image/jpeg')

    assert_difference -> { WardrobeItem.count }, 2 do
      assert_enqueued_jobs 2, only: BulkUploadProcessingJob do
        post bulk_upload_wardrobe_items_path, params: { images: [image_file1, image_file2] }
      end
    end

    assert_redirected_to wardrobe_items_path
    assert_equal "Your wardrobe items are being processed. You will be notified when complete.", flash[:notice]
  end

  test "should not create wardrobe item if no images uploaded and re-render form" do
    assert_no_difference 'WardrobeItem.count' do
      post bulk_upload_wardrobe_items_path, params: { images: [] }
    end

    assert_response :success
    assert_match "Please upload at least one image.", response.body
  end

  test "should re-render form with error if wardrobe item fails to save" do
    WardrobeItem.any_instance.stubs(:save).returns(false)

    image_file = fixture_file_upload(Rails.root.join('test', 'fixtures', 'files', 'test_image.jpg'), 'image/jpeg')

    assert_no_difference 'WardrobeItem.count' do
      post bulk_upload_wardrobe_items_path, params: { images: [image_file] }
    end

    assert_response :success
    assert_match "Some items could not be uploaded.", response.body
  end
end

