class ModalComponent < JumpstartComponent
  renders_one :header
  renders_one :body
  renders_one :actions

  def initialize(size: nil, card_class: nil, container_class: nil, close_button: true)
    @size = size
    @card_class = card_class
    @container_class = container_class
    @close_button = close_button
  end

  def container_class
    return @container_class if @container_class.present?

    case @size
    when :sm
      "modal rounded-lg max-w-sm max-h-screen w-full bg-transparent backdrop:backdrop-blur-sm"
    when :lg
      "modal rounded-lg max-w-lg max-h-screen w-full bg-transparent backdrop:backdrop-blur-sm"
    when :fullscreen
      "modal m-0 h-full w-full max-h-full max-w-full bg-transparent backdrop:backdrop-blur-sm"
    else # :md
      "modal rounded-lg max-w-md max-h-screen w-full bg-transparent backdrop:backdrop-blur-sm"
    end
  end

  def card_class
    return @card_class if @card_class.present?

    case @size
    when :fullscreen
      "p-6 w-full h-full"
    else
      "p-6"
    end
  end

  def close_button?
    !!@close_button
  end
end
