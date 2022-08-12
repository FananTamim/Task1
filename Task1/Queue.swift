//
//  Queue.swift
//  Task1
//
//  Created by user on 12/08/2022.
//

import Foundation

class Queue<T: Comparable> {
    var items : [T]
    var capacity: Int?
    
    init() {
        self.items = []
        self.capacity = nil
    }
    init(capacity: Int) {
        self.items = []
        self.capacity = capacity
    }
    func add(_ item: T) {
        items.append(item)
        guard let capacity = capacity else {
            return
        }
        if items.count > capacity {
            self.remove()
        }
    }
    func remove() -> T? {
        return items.isEmpty ? nil : items.remove(at: 0)
    }
    func peek() -> T? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
    func isEmpty() -> Bool {
        return items.isEmpty
    }
}

var myQueue = Queue<String>()
myQueue.add("c")
myQueue.add("a")
myQueue.remove()
myQueue.peek()
myQueue.isEmpty()
