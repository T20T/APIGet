//
//  DigitalOceanAPI.swift
//  Api
//
//  Created by Taghrid Alkwayleet on 11/11/1444 AH.
//

import SwiftUI
import Foundation

struct DigitalOResponse: Codable {
    var digitalO: [DigitalApi]
}

struct DigitalApi: Codable, Identifiable {
    
    var id: String
    let name: String
    let url: String
    let updated_at: String
    let status: String
    
}

struct DigitalOceanAPI: View {
    @State private var digitalO = [DigitalApi]()
    
    
    var body: some View {
        List(digitalO, id: \.id) { digitalO in
            VStack(alignment: .leading) {
                
                Text(digitalO.name)
                    .font(.headline)
                    .foregroundColor(.green)
                Text(digitalO.status)
                    .font(.headline)
                Text(digitalO.url)
                    .font(.headline)
                    .foregroundColor(.blue)
                Text(digitalO.updated_at)
                    .font(.headline)
            }
            
        }
        
        .task {
            await loadData()
        }
    }
        func loadData() async {
            
            guard let url = URL(string: "https://status.digitalocean.com/api/v2/summary.json") else {
                print("Invalid URL")
                return
            }
            
            do {
                let (data, response ) = try await URLSession.shared.data(from: url)
                if let status = (response as? HTTPURLResponse)?.statusCode {
                    print (" Status Cod \(status)")
                }
                if let dataAsString = String(data: data, encoding: .utf8) {
                    print(dataAsString)
                }
                
                let decodedResponse = try JSONDecoder().decode(DigitalOResponse.self, from: data)
                
                digitalO = decodedResponse.digitalO
                
                
            } catch {
                print("Error \(error)")
                //print("Invalid data")
            }
        }
    }
    


struct DigitalOceanAPI_Previews: PreviewProvider {
    static var previews: some View {
        DigitalOceanAPI()
    }
}


