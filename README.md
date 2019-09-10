# Learning GraphQL

> Learning GraphQL using the Author's Haven (Blogging website) Ruby on Rails API

#### The API (example queries)

```
query allAuthors {
  users {
    id
    email
    firstName
    lastName
    articlesCount
    articles {
      id
      title
      body
      imageUrl
      author {
        firstName
      }
    }
  }
}
```

```
{
  "data": {
    "users": [
      {
        "id": "1",
        "email": "brucemakallan@gmail.com",
        "firstName": "Bruce",
        "lastName": "Makaaru",
        "articlesCount": 1,
        "articles": [
          {
            "id": "1",
            "title": "The ins and outs of madness",
            "body": "Lorem ipsum",
            "imageUrl": "http://image.com/image.jpg",
            "author": {
              "firstName": "Bruce"
            }
          }
        ]
      }
    ]
  }
}
```