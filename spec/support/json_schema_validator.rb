# rubocop:disable all
def expect_valid_serialized_model(model, options = {})
  # serializer = options[:serializer] || Object.const_get("#{model.to_s.classify}Serializer")
  object = options[:object] || FactoryGirl.build_stubbed(model)
  version = options[:version] || 'v1'
  # json ||= serializer.new(object).to_json
  json ||= ActiveModel::SerializableResource.new(object).serializable_hash.to_json
  schema_file = options[:schema_file] || Rails.root.join("docs/#{version}/schemas/#{model}_schema.json")
  schema = File.read(schema_file)
  expect(JSON::Validator.fully_validate(schema, json, strict: true)).to eq([])
end
# rubocop:enable all