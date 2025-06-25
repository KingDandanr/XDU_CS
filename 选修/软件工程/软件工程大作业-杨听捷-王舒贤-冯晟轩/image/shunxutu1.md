```mermaid
sequenceDiagram
    participant Local
    participant UserPage
    participant InputWindow
    participant APICtrUI

    Local ->> UserPage: Enter UserPage
    UserPage ->> InputWindow: Send Request
    InputWindow -->> Local:Provide Input Window
    Local ->> InputWindow:Enter API 
    InputWindow ->> APICtrUI: Transfer API
```