class TopicSerializer < ActiveModel::Serializer
  attributes :id, :slug, :title, :materials_count
end
