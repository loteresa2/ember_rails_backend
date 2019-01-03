class AuthorResource < JSONAPI::Resource
 # In Postman
 # Content-Type: application/vnd.api+json
 # Body: Raw
 # {
 #     "data":{
 #         "type": "authors",
 #         "attributes":{
 #             "first": "Jane",
 #             "last": "Austen"
 #         }
 #     }
 # }

  attributes :first, :last
end
