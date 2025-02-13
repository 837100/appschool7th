//
//  ContentView.swift
//  SwiftUIList
//
//  Created by SG on 1/14/25.
//

import SwiftUI

struct ToDoItem : Identifiable {
    var id = UUID()
    var task: String
    var imageName: String
}

struct ContentView: View {
    @State var listData: [ToDoItem] = [
        ToDoItem(task: "Take out trash", imageName: "trash.circle.fill"),
        ToDoItem(task: "Pick up the kids", imageName: "person.2.fill"),
        ToDoItem(task: "Wash the car", imageName: "car.fill")
    ]
    
    @State private var toggleStatus = true
    @State private var stackPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $stackPath) {
            List {
                Section(header: Text("Setting")){
                    Toggle(isOn: $toggleStatus) {
                        Text("Allow Notifications")
                    }
                }
                
                Section(header: Text("To Do Tasks")){
                    ForEach (listData) { item in
                        NavigationLink(value: item.task) {
                            HStack {
                                Image(systemName: item.imageName)
                                Text(item.task)
                            }
                        }
                    }
                    .onDelete(perform: deleteItem)
                    .onMove(perform: moveItem)
                    .onAppear()
                }
              
            }
            // 네비게이션 바 타이틀 지정
            
           
            .navigationBarTitle(Text("To Do List"))
            
            
//            .navigationBarItems(trailing: Button(action: {}) {
//                Text("Add")
//            })
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading,
                            content: {EditButton()})
                ToolbarItem(placement: .primaryAction,
                            content: {Button("Add", action: {})})
            })

            .navigationBarItems(trailing: EditButton())
            
            .navigationDestination(for: String.self) { task in
                Text("Selected task = \(task)")
            }
            .refreshable {
                listData = [
                    ToDoItem(task: "Order dinner", imageName: "dollarsign.circle.fill"),
                    ToDoItem(task: "Call finacial advisor", imageName: "phone.fill"),
                    ToDoItem(task: "Sell the kids", imageName: "person.2.fill")
                ]
            }
        }
        
       

        
    } // end of body
    
    func addTask () {
        print("test")
    }

    func deleteItem (at offsets: IndexSet) {
         // 데이터 소스에서 항목을 삭제하는 코드.
        print("delete \(offsets)")
        listData.remove(atOffsets: offsets)
    }

    func moveItem (from source: IndexSet, to destination: Int) {
        print("move \(source) to \(destination)")
        listData.move(fromOffsets: source, toOffset: destination)
    }
} // end of ContentView





#Preview {
    ContentView()
}
