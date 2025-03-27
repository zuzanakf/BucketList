//
//  ContentView.swift
//  BucketList
//
//  Created by Zuzana.Fernandes on 26/03/2025.
//

import SwiftUI

// user struct
struct User: Comparable, Identifiable {
    let id = UUID()
    var firstName: String
    var lastName: String
    
    static func <(lhs: User, rhs: User) -> Bool{
        lhs.lastName < rhs.lastName
    }
}

struct ContentView: View {
    var users = [
        User(firstName: "Zuzana", lastName: "Kubascikova"),
        User(firstName: "Jana", lastName: "Kriz"),
        User(firstName: "Petr", lastName: "Mojtek"),
        User(firstName: "Vojtech", lastName: "Svoboda"),
    ].sorted()
    var body: some View {
        List(users) { user in
            Text("\(user.firstName) \(user.lastName)")
        }
        //saving data to documents
        Button("read and write") {
            let data = Data("test message".utf8)
            let url = URL.documentsDirectory.appending(path: "message.txt")
            
            do {
                try data.write(to: url, options: [.atomic, .completeFileProtection])
                let input = try String(contentsOf: url)
                print(input)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    ContentView()
}
