class GemstoneSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :description,
             :price,
             :color,
             :faces,
             :shine
end
