```mermaid
sequenceDiagram
    participant User
    participant "My Page"
    participant Login System
    participant AI Large Model Platform
    participant Database

    User ->> "My Page": Click Login
    "My Page" ->> Login System: Send Phone Number
    Login System ->> AI Large Model Platform: Verify Phone Number
    AI Large Model Platform ->> Database: Query if Phone Number Exists
    Database -->> AI Large Model Platform: Return Query Result
    alt Phone Number Exists
        AI Large Model Platform -->> Login System: Return Verification Success
        Login System -->> "My Page": Display Login Success, Redirect to AI Large Model Interface
    else Phone Number Does Not Exist
        AI Large Model Platform -->> Login System: Return Verification Failure
        Login System -->> "My Page": Display "Phone Number Does Not Exist. Please Register"
    end
```