# WSManager

Simple WebSocket manager.

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
