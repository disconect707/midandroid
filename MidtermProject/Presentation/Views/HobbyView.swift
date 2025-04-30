//  HobbyView.swift
//  MidtermProject
//
//  Created by dias on 30.04.2025.
//

import SwiftUI

struct HobbyView: View {
    @StateObject private var vm = DI.makeItemListVM()
    @State private var newHobby: String = ""

    var body: some View {
        VStack {
            // Ввод нового хобби
            HStack {
                TextField("Новое хобби…", text: $newHobby)
                    .textFieldStyle(.roundedBorder)
                Button("Добавить") {
                    vm.add(Item(id: UUID(), title: newHobby))
                    newHobby = ""
                }
                .disabled(newHobby.trimmingCharacters(in: .whitespaces).isEmpty)
            }
            .padding()

            // Список хобби с возможностью удаления
            List {
                ForEach(vm.items, id: \.id) { item in
                    Text(item.title)
                }
                .onDelete(perform: vm.remove(at:))
            }
        }
        .navigationTitle("Мои хобби")
    }
}

struct HobbyView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HobbyView()
        }
    }
}
