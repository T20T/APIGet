//
//  ContentView.swift
//  Api
//
//  Created by Taghrid Alkwayleet on 09/11/1444 AH.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct ContentView: View {
    @State private var results = [Result]()

    
    //    @StateObject var viewModel = ViewModel()
    //
    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
                    
                    }
            
            }
        
        .task {
            await loadData()
        }
    }
        
func loadData() async {
    
    guard let url = URL(string: "https://itunes.apple.com/search?term=shakira&entity=song") else {
        print("Invalid URL")
        return
    }
    do {
        let (data, _) = try await URLSession.shared.data(from: url)

        if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
            results = decodedResponse.results
        }
        
    } catch {
        print("Invalid data")
    }
        }
            
        
        //      NavigationView {
        //        TabBarView()
        //          .environmentObject(viewModel)
        //      }
        //    }
        //  }
        //
        //  class ViewModel: ObservableObject {
        //    @Published var urls: [URL] = [
        //      URL(string: "https://api.openweathermap.org/data/2.5/weather?q=London&appid=YOUR_API_KEY")!,
        //      URL(string: "https://api.dictionaryapi.dev/api/v2/entries/word?word=hello")!,
        //    ]
        //
        //    func fetchData() {
        //      for url in urls {
        //        URLSession.shared.dataTask(with: url) { data, response, error in
        //          guard let data = data, error == nil else {
        //            print(error ?? "No error")
        //            return
        //          }
        //
        //          let response = try! JSONDecoder().decode(APIResponse.self, from: data)
        //          print(response)
        //        }.resume()
        //      }
        //    }
        //  }
        //
        ////  struct APIResponse: Decodable {
        ////    let name: String
        ////    let description: String
        //
        //      struct APIResponse: Decodable {
        //
        //
        //        let avatar_url: String
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

