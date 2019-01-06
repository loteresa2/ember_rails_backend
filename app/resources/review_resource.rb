class ReviewResource < JSONAPI::Resource
  attributes :user, :body, :created_at
  has_one :book

  # {
  #     "data":{
  #         "type": "reviews",
  #         "attributes":{
  #             "user": "Teresa",
  #             "body": "Book was good"
  #         },
  #         "relationships": {
  #             "book": {
  #                 "data":{
  #                     "type": "books",
  #                     "id": "6"
  #                 }
  #             }
  #         }
  #     }
  # }
end
