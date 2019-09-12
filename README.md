# Learning GraphQL

> Learning GraphQL using the Author's Haven (Blogging website) Ruby on Rails API

#### The LIVE App
https://authors-haven-rails-graphql.herokuapp.com/graphql

Recommended App: [Insomnia](https://insomnia.rest/)

#### The API (example queries)

1. **List all Authors**
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
    *Response*
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

2. **Get specific Article image**
    ```
    query oneArticle($id: ID!) {
      article(id: $id) {
        imageUrl
      }
    }
    ```
    *Variables*
    ```
    { "id": 1 }
    ```
    *Response*
    ```
    {
      "data": {
        "article": {
          "imageUrl": "http://image.com/image.jpg"
        }
      }
    }
    ```

3. **Create user (Signup) and Login**
   ```
    mutation Login {
      login(input: {
        email: "allan@gmail.com"
        password: "123456aA"
      }) {
        user {
          ...UserDetails
        }
        token
        errors
      }
    }

    mutation SignUp {
      createUser(input: {
        firstName: "Allan",
        lastName: "Makaaru",
        email: "allan@gmail.com",
        password: "123456aA"
      }) {
        user {
          ...UserDetails
        }
        token
        errors
      }
    }

    query users {
      users {
        firstName
        email
      }
    }

    fragment UserDetails on User {
      id
      email
      firstName
      lastName
      articlesCount
    }
   ```
