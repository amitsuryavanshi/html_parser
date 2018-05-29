class TagResource < JSONAPI::Resource
  attributes :name, :content
  has_one :document
end