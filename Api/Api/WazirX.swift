//
//  WazirX.swift
//  Api
//
//  Created by Taghrid Alkwayleet on 10/11/1444 AH.
//

import SwiftUI
import Foundation

struct WazirXAPI: Codable, Identifiable {
   
    let city: String
    let country: String
    let country_name: String
    let currency: String
    let ip: String
    let languages: String
    let org : String
    var id: String {
        ip  }
}


struct WazirX: View {
    @State private var wazir = WazirXAPI(city: "", country: "", country_name: "", currency: "", ip: "", languages: "", org: "")


    var body: some View {
            VStack(alignment: .leading) {
                Text(wazir.city)
                    .font(.headline)
                Text(wazir.country)
                    .font(.headline)
                Text(wazir.country_name)
                    .font(.largeTitle)
                Text(wazir.currency)
                Text(wazir.ip)
                Text(wazir.languages)
                Text(wazir.org)

            }

        .task {
            await loadData()
        }
    }

func loadData() async {

    guard let url = URL(string: "https://ipapi.co/json") else {
        print("Invalid URL")
        return
    }
    do {
        let (data, _) = try await URLSession.shared.data(from: url)

        if let dataAsString = String(data: data, encoding: .utf8) {
            print(dataAsString)
        }
        
         let decodedResponse = try JSONDecoder().decode(WazirXAPI.self, from: data)
            
            wazir = decodedResponse
        

    } catch {
        print("Invalid data")
    }
        }
}
    

struct WazirX_Previews: PreviewProvider {
    static var previews: some View {
        WazirX()
    }
}
