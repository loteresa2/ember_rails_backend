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
  has_many :books

  filters :query

  def self.apply_filter(records, filter, value, options)
    case filter
    when :query
      records.where('last LIKE ?', "%#{value.first}%")
        .or(records.where('first LIKE ?', "%#{value.first}%"))
    else
      super
    end
  end
end
