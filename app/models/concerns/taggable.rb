module Taggable
  include ActiveSupport::Concern

  def tags_as_string
    tag_names.join(", ")
  end

  def tags_as_string=(string)
    self.tag_names = string.split(/,\s*/)
  end
end