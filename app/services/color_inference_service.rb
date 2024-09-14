# app/services/color_inference_service.rb
class ColorInferenceService
  # Simplified example of color inference
  COLORS = ["red", "blue", "green", "black", "white", "brown", "yellow", "pink"]

  def self.infer_color(tags)
    tags.each do |tag|
      return tag.capitalize if COLORS.include?(tag.downcase)
    end
    "Unknown" # Default if no color match
  end
end

