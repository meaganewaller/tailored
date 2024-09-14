require "test_helper"

class WardrobeItemTest < ActiveSupport::TestCase
  def setup
    @wardrobe_item = wardrobe_items(:one)
  end

  # ----------------------
  # Association Tests
  # ----------------------
  test "should belong to an account" do
    assert_respond_to @wardrobe_item, :account
  end

  test "should delete wardrobe items when account is deleted" do
    account = accounts(:one)
    assert_difference 'WardrobeItem.count', -account.wardrobe_items.count do
      account.destroy
    end
  end

  test "should have many outfits" do
    outfit = outfits(:one)
    @wardrobe_item.outfits << outfit
    assert_includes @wardrobe_item.outfits, outfit
  end

  test "should attach images" do
    @wardrobe_item.images.attach(io: File.open(Rails.root.join('test', 'fixtures', 'files', 'test_image.jpg')), filename: 'test_image.jpg')
    assert @wardrobe_item.images.attached?
  end

  # ----------------------
  # Validation Tests
  # ----------------------
  test "should not save wardrobe item without account" do
    wardrobe_item = WardrobeItem.new(name: "Test Item", category: "Footwear")
    assert_not wardrobe_item.save, "Saved the wardrobe item without an account"
    assert_includes wardrobe_item.errors[:account], "must exist"
  end

  test "should not save wardrobe item with invalid cost" do
    @wardrobe_item.cost = -10
    assert_not @wardrobe_item.save, "Saved the wardrobe item with negative cost"
  end

  test "should not save wardrobe item with non-numeric cost" do
    @wardrobe_item.cost = "invalid"
    assert_not @wardrobe_item.save, "Saved the wardrobe item with a non-numeric cost"
    assert_includes @wardrobe_item.errors[:cost], "is not a number"
  end

  test "should save wardrobe item with valid cost" do
    @wardrobe_item.cost = 50
    assert @wardrobe_item.save, "Failed to save the wardrobe item with valid cost"
  end

  test "should save wardrobe item with zero cost" do
    @wardrobe_item.cost = 0
    assert @wardrobe_item.save, "Failed to save the wardrobe item with zero cost"
  end

  test "should save wardrobe item with a very large cost" do
    @wardrobe_item.cost = 1_000_000_000
    assert @wardrobe_item.save, "Failed to save the wardrobe item with a very large cost"
  end

  test "should auto-generate name if blank" do
    item = WardrobeItem.create!(tags: ["dress"], account: accounts(:one))
    assert item.name.start_with?("Wardrobe Item #")
  end

  test "should auto-generate name for multiple wardrobe items" do
    first_item = WardrobeItem.create!(tags: ["dress"], account: accounts(:one))
    second_item = WardrobeItem.create!(tags: ["dress"], account: accounts(:one))
    assert_match /Wardrobe Item #\d+/, first_item.name
    assert_match /Wardrobe Item #\d+/, second_item.name
    assert_not_equal first_item.name, second_item.name
  end

  # ----------------------
  # Category & Subcategory Inference Tests
  # ----------------------
  test "should infer the category and multiple subcategories" do
    @wardrobe_item.update(tags: ["Sheath dress", "Day dress", "waist", "sleeve", "footwear"])

    @wardrobe_item.save

    assert_equal "Dresses", @wardrobe_item.reload.category
    assert_equal ["Sheath dress", "Day dress"], @wardrobe_item.reload.subcategories
  end

  test "should handle empty tags gracefully" do
    @wardrobe_item.update(tags: [])

    assert_nil @wardrobe_item.category
    assert_empty @wardrobe_item.subcategories
  end

  test "should handle non-matching tags" do
    @wardrobe_item.update(tags: ["random", "non-clothing"])

    assert_nil @wardrobe_item.category
    assert_empty @wardrobe_item.subcategories
  end

  test "should avoid duplicates in subcategories" do
    @wardrobe_item.update(tags: ["Sheath dress", "Sheath dress", "Day dress"])

    @wardrobe_item.save

    assert_equal ["Sheath dress", "Day dress"], @wardrobe_item.reload.subcategories
  end

  test "should infer category with one subcategory" do
    @wardrobe_item.update(tags: ["Sheath dress"])
    assert_equal "Dresses", @wardrobe_item.reload.category
    assert_equal ["Sheath dress"], @wardrobe_item.reload.subcategories
  end

  # ----------------------
  # Colors Validation Tests
  # ----------------------
  test "should not save wardrobe item with invalid colors" do
    @wardrobe_item.colors = [{ "hex" => "ZZZZZZ", "score" => "high" }]  # Invalid hex and score
    assert_not @wardrobe_item.save, "Saved the wardrobe item with invalid colors"
    assert_includes @wardrobe_item.errors[:colors], "Each color must have a valid hex value and score."
  end

  test "should save wardrobe item with valid colors" do
    @wardrobe_item.colors = [{ "hex" => "#ffffff", "score" => 0.9 }]  # Valid hex and score
    assert @wardrobe_item.save, "Failed to save the wardrobe item with valid colors"
  end

  # ----------------------
  # Default Values Tests
  # ----------------------
  test "should allow multiple occasions" do
    @wardrobe_item.update(occasions: ["formal", "wedding", "party"])
    assert_equal ["formal", "wedding", "party"], @wardrobe_item.reload.occasions
  end

  test "should set default season and occasions" do
    item = WardrobeItem.create!(tags: ["shirt"], account: accounts(:one))
    assert_equal "All Season", item.season
    assert_empty item.occasions
  end
end
