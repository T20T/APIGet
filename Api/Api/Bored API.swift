//
//  Bored API.swift
//  Api
//
//  Created by Taghrid Alkwayleet on 10/11/1444 AH.
//

import SwiftUI
import Foundation

struct BoredApi: Codable, Identifiable{
    let activity: String
    let type: String
    var id: String {
        activity
    }
}

struct Bored_API: View {
    @State private var bored = BoredApi(activity: "", type: "")
    
    
    //    @StateObject var viewModel = ViewModel()
    //
    var body: some View {
        VStack(alignment: .leading) {
            Text(bored.activity)
                .font(.headline)
            Text(bored.type)
            
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async {
        
        guard let url = URL(string: "https://www.boredapi.com/api/activity/" )
        else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let dataAsString = String(data: data, encoding: .utf8) {
                print(dataAsString)
            }
            
            let decodedResponse = try JSONDecoder().decode(BoredApi.self, from: data)
            
            bored = decodedResponse
        } catch {
            print(error)
        }
    }
}


struct Bored_API_Previews: PreviewProvider {
    static var previews: some View {
        Bored_API()
    }
}
