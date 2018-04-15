class TopicSerializer < ActiveModel::Serializer
  attributes :id, :title, :slug, :materials_count
end
