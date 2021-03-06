//
//  ContentView.swift
//  News
//
//  Created by Famil Samadli on 9/30/20.
//

import SwiftUI

struct ContentView: View {
    
    //subscribe to object from network manager
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            List(networkManager.posts) { post in
                NavigationLink(
                    destination: DetailView(url: post.url),
                    label: {
                        HStack {
                            Text(String(post.points))
                            Text(post.title)
                        };
                    })
            }
            .navigationBarTitle("News")
        }
        .onAppear(perform: {
            self.networkManager.fetchData()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
