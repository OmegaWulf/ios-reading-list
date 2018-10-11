//
//  BookController.swift
//  Reading List
//
//  Created by Nikita Thomas on 10/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class BookController {
    var books = [Book]()
    var readBooks: [Book] {
        return books.filter({$0.hasBeenRead})
    }
    var unreadBooks: [Book] {
        return books.filter({$0.hasBeenRead == false})
    }
    
    let ReadingListurl = URL(fileURLWithPath: NSHomeDirectory())
        .appendingPathComponent("Documents")
        .appendingPathComponent("ReadingList.plist")
    
    func saveToPersistentStore() {
        let encoder = PropertyListEncoder()
        do {
            let booksData = try encoder.encode(books)
            try booksData.write(to: ReadingListurl)
            
        } catch {
            print("Error: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        do {
            let data = try Data(contentsOf: ReadingListurl)
            let decoder = PropertyListDecoder()
            let decodedBooks = try decoder.decode([Book].self, from: data)
            books = decodedBooks
        } catch {
            print("Error: \(error)")
        }
    }
    
    func create(title: String, reasonToRead: String) {
        let book = Book.init(title: title, reasonToRead: reasonToRead)
        books.append(book)
        saveToPersistentStore()
    }
    
    func delete(book: Book) {
        guard let index = books.index(of: book) else {return}
        books.remove(at: index)
        saveToPersistentStore()
    }
    
    func updateHasBeenRead(for book: Book) {
        guard let index = books.index(of: book) else {return}
        var theBook = books[index]
        switch theBook.hasBeenRead {
        case true:
            theBook.hasBeenRead = false
        case false:
            theBook.hasBeenRead = true
        }
        saveToPersistentStore()
    }
    
    func updateBook(book: Book, title: String, reasonToRead: String) {
        guard let index = books.index(of: book) else {return}
        var theBook = books[index]
        theBook.title = title
        theBook.reasonToRead = reasonToRead
        saveToPersistentStore()
    }
    
}
