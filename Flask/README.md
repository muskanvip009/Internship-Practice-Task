# Flask Learning Overview

- **Basic Concepts**
- **A small project using flask**


## Key Technologies and Libraries
- **Flask**: A lightweight web framework for Python.
- **MySQL Connector**: For connecting and interacting with a MySQL database.
- **JWT (JSON Web Tokens)**: For handling user authentication and authorization.
- **Python Libraries**: Including `datetime`, `jwt`, `re`, and `functools`.

## Features and Operations

### User Management
1. **Get All Users**
   - **Endpoint**: `/user/getall`
   - **Method**: `GET`
   - **Authentication**: Required

2. **Add One User**
   - **Endpoint**: `/user/addone`
   - **Method**: `POST`

3. **Add Multiple Users**
   - **Endpoint**: `/user/addmultiple`
   - **Method**: `POST`

4. **Update User**
   - **Endpoint**: `/user/update`
   - **Method**: `PUT`

5. **Patch User**
   - **Endpoint**: `/user/patch/<id>`
   - **Method**: `PATCH`

6. **User Pagination**
   - **Endpoint**: `/user/getall/limit/<limit>/page/<page>`
   - **Method**: `GET`

7. **Upload User Avatar**
   - **Endpoint**: `/user/<uid>/upload/avatar`
   - **Method**: `PUT`

8. **User Login**
   - **Endpoint**: `/user/login`
   - **Method**: `POST`


### Authentication and Authorization
- **JWT**: Used to secure endpoints and manage user sessions.
- **Custom Decorator**: For role-based access control, ensuring only authorized users can access certain endpoints.

### Database Integration
- **MySQL**: Used as the database to store user information and handle CRUD operations.
- **SQL Workbench**: For managing the database schema and data.

### API Documentation
- **Endpoints**: Clearly defined for various user operations.
- **HTTP Methods**: Utilized appropriately for different CRUD operations.
- **Status Codes**: Returned to indicate the success or failure of operations.

### Tools for Testing
- **Postman**: Used for testing API endpoints by sending HTTP requests and verifying responses.

### Conclude the project by forming a small project of todo app 