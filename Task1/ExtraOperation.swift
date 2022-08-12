//
//  ExtraOperation.swift
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

extension Queue {
    
    func insertAtIndex(value: T, index: Int) {
        guard index <= self.items.count else {
            print("index out of range")
            return
        }
        items.insert(value, at: index)
    }
    func removeAtIndex(index: Int) -> T? {
        guard index <= self.items.count-1 else {
            print("index out of range")
            return nil
        }
        return items.isEmpty ? nil : items.remove(at: index)
    }
    func sortQueue() -> [T]? {
        return items.isEmpty ? nil : items.sorted()
    }
    func resizeCapacity(newCapacity: Int){
        self.capacity = newCapacity
        while self.items.count > self.capacity! {
            self.remove()
        }
    }
    func removeDuplicates<T: Hashable>(array: [T]) -> [T] {
        var set = Set<T>()
        let result = array.filter {
            guard !set.contains($0) else {
                return false
            }
            set.insert($0)
            return true
        }
        return result
    }
}

class Node: Comparable {
    static func < (lhs: Node, rhs: Node) -> Bool {
        lhs.x < rhs.x
    }
    
    static func == (lhs: Node, rhs: Node) -> Bool {
        lhs.x == rhs.x
    }
    
    var x : Int
    init(x: Int) {
        self.x = x
    }
}

var myQueue = Queue<String>()
myQueue.add("c")
myQueue.add("a")
myQueue.remove()
myQueue.peek()
myQueue.isEmpty()
myQueue.insertAtIndex(value: "d", index: 2)
myQueue.insertAtIndex(value: "b", index: 3)
myQueue.removeAtIndex(index: 0)
print(myQueue.items)
print(myQueue.sortQueue())
myQueue.peek()
myQueue.add("3")
myQueue.isEmpty()
myQueue.add("4")
myQueue.add("5")
myQueue.resizeCapacity(newCapacity: 4)
print(myQueue.sortQueue())
myQueue.remove()
myQueue.peek()
myQueue.remove()
myQueue.peek()
myQueue.remove()
myQueue.remove()
myQueue.remove()
myQueue.isEmpty()
var my2 = Queue<Int>()
print(my2.removeDuplicates(array: my2.items))
my2.add(1)
print(my2.items)
my2.add(2)
print(my2.items)
my2.add(3)
print(my2.items)
my2.add(4)
print(my2.items)
my2.add(3)
print(my2.items)
my2.add(2)
print(my2.items)
print(my2.removeDuplicates(array: my2.items))


var my3 = Queue<Node>()
my3.add(Node(x: 1))
my3.add(Node(x: 2))
my3.add(Node(x: 3))
my3.add(Node(x: 4))
my3.peek()
print(my3.sortQueue())
