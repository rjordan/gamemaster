def expect_valid_json_document(schema)
  doc = JSON.parse(response.body)
  expect(JSON::Validator.fully_validate(schema, doc, strict: true)).to eq([])
end

def expect_valid_json_list(schema)
  doc = JSON.parse(response.body)
  expect(JSON::Validator.fully_validate(schema, doc, strict: true, list: true)).to eq([])
end