# WSManager

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
