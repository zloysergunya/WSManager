# WSManager
## Simple WebSocket manager.

Just add the file to your project and use it!

Change the link to your server in WSManager
```swift
let webSocketTask = URLSession(configuration: .default).webSocketTask(with: URL(string: "YOURLINK")!)
```

Connecting to WebSocket server.
```swift
WSManager.shared.send(message: "{\"type\":\"subscribe\",\"symbol\":\"AAPL\"}")
WSManager.shared.timeInterval = 5
WSManager.shared.connect()
```

Disconnecting from WebSocket server.
```swift
WSManager.shared.disconnect()
```

Set the time interval
```swift
WSManager.shared.timeInterval = 5
```

Send a message to the server
```swift
WSManager.shared.send(message: "YOURMESSAGE")
```
