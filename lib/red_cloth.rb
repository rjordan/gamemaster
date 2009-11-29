class RedCloth
  attr_accessor :text

  def initialize(text, *args)
    self.text = text
  end

  def to_html
    text
  end
end
