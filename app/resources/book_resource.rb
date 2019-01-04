class BookResource < JSONAPI::Resource
  attributes :title, :isbn, :publish_date
  has_one :author

  filters :query

  # {
  #     "data":{
  #         "type": "books",
  #         "attributes":{
  #             "title": "For Whom The Bell Tolls",
  #             "isbn": "12345",
  #             "publish-date": "Oct 21, 1940"
  #         },
  #         "relationships": {
  #             "author": {
  #                 "data":{
  #                     "type": "authors",
  #                     "id": "10"
  #                 }
  #             }
  #         }
  #     }
  # }

  def self.apply_filter(records, filter, value, options)
    case filter
    when :query
      records.where('title LIKE ?', "%#{value.first}%")
        .or(records.where('isbn LIKE ?', "%#{value.first}%"))
    else
      super
    end
  end
end
