//
//  NetworkMonitor.swift
//  WorldOfPayback
//
//  Created by swamnx on 9.04.23.
//

import SwiftUI
import Network

class NetworkMonitor: ObservableObject {

    private let networkMonitor = NWPathMonitor()
    private let workerQueue = DispatchQueue(label: "Monitor")
    @Published private (set) var isConnected = false

    init() {
        networkMonitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied
            }
        }
        networkMonitor.start(queue: workerQueue)
    }
}
