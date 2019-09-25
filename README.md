# Chat System

This is a simple application to create chats and messages using the following technologies

* Ruby in Rails
* Elastic Search
* Redis
* SideKiq
* Docker
* Docker Compose

### Requirements to Run
you must have the following installed
* Docker
* Docker Compose


###Steps to run
1. clone the repository
1. run `docker-compose up`

* Note that application is running on port 3001

##API Documentation

#### Create Chat:
* Type: Post 
* url: http://localhost:3001/applications/create_chat
* body: `{
         	"chat": {
         		"app_token": "token",
         		"name": "chat name"
         	}
         }`
* response: chat number
 
### Create Message:

 * Type: Post 
 * url: http://localhost:3001/chats/create_message
 * body: `{
          	"chat": {
          		"app_token": "token"
          	},
          	"message": {
          		"content": "content",
          		"chat_number": "chat number"
          	}
          }`
 * response: message number
 
 ### Search for message in chat
 
  * Type: Get 
  * url: http://localhost:3001/chats/:id/search/:search_text
  * response: messages that meet search text


