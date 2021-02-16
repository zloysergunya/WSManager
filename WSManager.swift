//
//  WSManager.swift
//  YandexMDS2021
//
//  Created by Sergey Kotov on 16.02.2021.
//

import Foundation

class WSManager {
    public static let shared = WSManager()
    private init(){}
        
    let webSocketTask = URLSession(configuration: .default).webSocketTask(with: URL(string: "wss://ws.finnhub.io?token=c0ljtrn48v6orbr1fv3g")!)
    private var timer: Timer?
    var timeInterval: TimeInterval = 2
    
    func connect() {
        webSocketTask.resume()
        setupTimeInterval()
    }
    
    func disconnect() {
        webSocketTask.cancel(with: .normalClosure, reason: nil)
        timer?.invalidate()
    }
    
    private func setupTimeInterval() {
        timer = Timer.scheduledTimer(timeInterval: timeInterval,
                             target: self,
                             selector: #selector(receiveData),
                             userInfo: nil,
                             repeats: true)
    }
    
    func send(message: String) {
        let message = URLSessionWebSocketTask.Message.string(message)
        webSocketTask.send(message) { error in
            if let error = error {
                print("WebSocket - не удалось отправить сообщение: \(error)")
            }
        }
    }
    
    @objc func receiveData() {
        webSocketTask.receive { result in
            switch result {
            case .success(let message):
                print("WebSocket - полученный текст: \(message)")
            case .failure(let error):
                print("WebSocket - ошибка получения данных: \(error)")
            }
        }
    }
}
