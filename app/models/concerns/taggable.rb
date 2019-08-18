module Taggable
  extend ActiveSupport::Concern

  included do 
    has_many :taggings, as: :taggable
    has_many :tags, through: :taggings
    accepts_nested_attributes_for :tags, reject_if: :reject_tags, allow_destroy: true
  end

  def reject_tags(attributes)
    tag_name = attributes['name']
    tag_name.blank? || tags.collect(&:name).include?(tag_name)
  end
end