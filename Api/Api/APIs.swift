////
////  APIs.swift
////  Api
////
////  Created by Taghrid Alkwayleet on 10/11/1444 AH.
////
//
//import SwiftUI
//
//
//
//struct TabBarView: View {
//  @State private var selectedTab = 0
//@EnvironmentObject var viewModel: ViewModel
//
//  var body: some View {
//    TabView(selection: $selectedTab) {
//      Text("API 1")
//        .tabItem {
//          Text("API 1")
//        }
//      Text("API 2")
//        .tabItem {
//          Text("API 2")
//        }
//      Text("API 3")
//        .tabItem {
//          Text("API 3")
//        }
//    }
//    .onAppear {
//      self.viewModel.fetchData()
//    }
//  }
//}
//
//struct API1View: View {
//  var body: some View {
//    Text("This is API 1")
//  }
//}
//
//struct API2View: View {
//  var body: some View {
//    Text("This is API 2")
//  }
//}
//
//struct API3View: View {
//  var body: some View {
//    Text("This is API 3")
//  }
//}
//
//struct TabBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBarView()
//    }
//}
