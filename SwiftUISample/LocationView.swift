//
//  LocationView.swift
//  SwiftUISample
//
//  Created by Parth Shah on 2024-07-13.
//

import SwiftUI

struct LocationView: View {
    var body: some View {
        TabView{
            NavigationView{
                ZStack(alignment: .leading){
                    VStack(spacing : 0){
                        
                        
                        
                        HStack{
                            Image(systemName: "globe")
                                .imageScale(.large)
                                .foregroundStyle(.tint)
                            Text("Little Lemon")
                        }.padding(.top,24)
                        
                        List {
                            
                            ForEach(restaurantList,id : \.self) { Restaurant in
                                
                                NavigationLink( destination: FormView(selectedRestaurant: Restaurant)){
                                    VStack(alignment: .leading){
                                        Text(Restaurant.name)
                                            .font(.headline)
                                            .fontWeight(Font.Weight.medium)
                                        
                                        Text(Restaurant.description)
                                            .font(.subheadline)
                                            .fontWeight(Font.Weight.ultraLight)
                                        
                                        
                                    }
                                }
                                
                            }
                            
                        }.scrollContentBackground(.hidden)
                            .background(Color.white)
                    }
                }
            }
            .navigationTitle("Demo")
            .navigationBarTitleDisplayMode(.inline)
            
            
            .tabItem{
                Label("Home",systemImage: "list.bullet")
            }
            
            Text("Settings View")
             .tabItem {
                Label("Settings",systemImage: "gear")
            }
        }
    }
}

struct Restaurant : Identifiable,Hashable {
    let id = UUID()
    var name : String
    var description : String
}

var restaurantList = [
    Restaurant(name: "Las Vegas", description: "Downtown - (702) 555-9898"),
    Restaurant(name: "Los Angels", description: "North Hollywood - (213) 555-1453"),
    Restaurant(name: "Los Angels", description: "Venice - (213) 555-1453"),
    Restaurant(name: "Nevada", description: "Venice - (725) 555-5454"),
    Restaurant(name: "San Francisco", description: "North Beach - (415) 555-1345"),
    Restaurant(name: "San Francisco", description: "Union Square - (415) 555-9813")
]

#Preview {
    LocationView()
}
