class SeasonInferenceService
  SEASON_TAGS = {
    "summer" => ["shorts", "swimwear", "sundress"],
    "winter" => ["coat", "jacket", "sweater"],
    "spring" => ["light jacket", "cardigan", "raincoat"],
    "fall" => ["sweater", "jacket", "trench coat"]
  }

  def self.infer_season(tags)
    SEASON_TAGS.each do |season, terms|
      tags.each do |tag|
        return season.capitalize if terms.include?(tag.downcase)
      end
    end
    "All Season" # Default value
  end
end
