class ColorMatcherService
  def detect_colors(image)
    vision = Google::Cloud::Vision.image_annotator
    image_file = StringIO.new(image.download)
    response = vision.image_properties_detection(image: image_file)

    return [] if response.responses.empty? || response.responses.first.image_properties_annotation.nil?

    # Extract dominant colors from the response
    dominant_colors = response.responses.first.image_properties_annotation.dominant_colors.colors

    # Get hex values or descriptive colors from the dominant colors
    dominant_colors.map do |color_info|
      {
        hex: hex_color_from_rgb(color_info.color),
        score: color_info.score
      }
    end
  end

  def self.detect_colors(image)
    ColorMatcherService.new.detect_colors(image)
  end

  private

  def hex_color_from_rgb(color)
    red = color.red.to_i
    green = color.green.to_i
    blue = color.blue.to_i
    format("#%02x%02x%02x", red, green, blue)
  end
end
