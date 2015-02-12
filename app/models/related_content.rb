class RelatedContent < ActiveRecord::Base
  scope :active , -> { where is_active: 1}
  scope :inactive , -> { where is_active: 0}
  attr_accessible :id_parent, :id_related_to, :is_active, :type_relation
end
