//
//  ContentView.swift
//  BucketList
//
//  Created by Zuzana.Fernandes on 26/03/2025.
//

import SwiftUI

// user struct
// using Comparable on cutsom types
struct User: Comparable, Identifiable {
    let id = UUID()
    var firstName: String
    var lastName: String
    
    static func <(lhs: User, rhs: User) -> Bool{
        lhs.lastName < rhs.lastName
    }
}


// swicthing view states with enums
struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}
struct SuccessView: View {
    var body: some View {
        Text("Success!")
    }
}

struct FailureView: View {
    var body: some View {
        Text("Failed!")
    }
}

struct ContentView: View {
    // using Comparable on cutsom types
    var users = [
        User(firstName: "Zuzana", lastName: "Kubascikova"),
        User(firstName: "Jana", lastName: "Kriz"),
        User(firstName: "Petr", lastName: "Mojtek"),
        User(firstName: "Vojtech", lastName: "Svoboda"),
    ].sorted()
    
    // swicthing view states with enums
    enum LoadingState {
        case loading, sucess, failed
    }
    @State private var loadingState = LoadingState.loading
    
    var body: some View {
        // using Comparable on cutsom types
        List(users) { user in
            Text("\(user.firstName) \(user.lastName)")
        }
        
        // swicthing view states with enums
        if loadingState == .loading {
            LoadingView()
        } else if loadingState == .sucess {
            SuccessView()
        } else {
            FailureView()
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
