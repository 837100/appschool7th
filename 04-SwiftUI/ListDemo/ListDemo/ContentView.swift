//
//  ContentView.swift
//  ListDemo
//
//  Created by SG on 1/14/25.
//

import SwiftUI

struct ToDoItem: Identifiable {
    let id: UUID = UUID()
    var task: String
    var imageName: String
}

struct ContentView: View {
    
    @State var toggleStatus: Bool = false
    @State var listData: [ToDoItem] = [
        ToDoItem(task: "Task out trash", imageName: "trash.circle.fill"),
        ToDoItem(task: "Pick up the kids", imageName: "person.2.fill"),
        ToDoItem(task: "Wash the car", imageName: "car.fill")
    ]
    
    var body: some View {
        //        List {
        //            Text("Wash the car")
        //            Text("Vacuum house")
        //            Text("Pick up kids from school bus @ 3pm")
        //            Text("Auction the kids on eBay")
        //            Text("Order Pizza for dinner")
        //
        //            HStack {
        //                Image(systemName: "trash.circle.fill")
        //                Text("Take out the trash")
        //            }
        //            HStack {
        //                Image(systemName: "person.2.fill")
        //                Text("Pick up the kids")
        //            }
        //            HStack {
        //                Image(systemName: "car.fill")
        //                Text("Wash the car")
        //            }
        //            Text("Wash the car")
        //                .listRowSeparator(.hidden)
        //            Text("Pick up kids from school bus @ 3pm")
        //                .listRowSeparatorTint(.green)
        //            Text("Auction the kids on eBay")
        //                .listRowSeparatorTint(.red)
        //            Text("Order Pizza for dinner")
        //                .listRowBackground(Image("background"))
        //
        //        }
    
        
        List {
            
            Section(header: Text("Settings")){
                Toggle(isOn: $toggleStatus){
                    Text("Allow Notifications")
                }
            }
            Section(header: Text("To Do Tasks")) {
                ForEach(listData) {
                    item in
                    HStack {
                        Image(systemName: item.imageName)
                        Text(item.task)
                    }
                }
            }
        } // end of List
        .refreshable {
            listData = [
                ToDoItem(task: "Order dinner", imageName: "dollarsign.circle.fill"),
                ToDoItem(task: "Call financial advisor", imageName: "phone.fill"),
                ToDoItem(task: "Sell the Kids", imageName: "person.2.fill")
                
            ]
        }
        
        
        
    }
}

#Preview {
    ContentView()
}
