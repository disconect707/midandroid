//  SportView.swift
//  MidtermProject
//
//  Created by dias on 30.04.2025.
//

import SwiftUI

struct SportView: View {
    @StateObject private var vm = DI.makeItemListVM()
    @State private var newSport: String = ""

    var body: some View {
        VStack {
            // Ввод новой спортивной активности
            HStack {
                TextField("Новая активность…", text: $newSport)
                    .textFieldStyle(.roundedBorder)
                Button("Добавить") {
                    vm.add(Item(id: UUID(), title: newSport))
                    newSport = ""
                }
                .disabled(newSport.trimmingCharacters(in: .whitespaces).isEmpty)
            }
            .padding()

            // Список активностей с удалением
            List {
                ForEach(vm.items, id: \.id) { item in
                    Text(item.title)
                }
                .onDelete(perform: vm.remove(at:))
            }
        }
        .navigationTitle("Мои спортивные увлечения")
    }
}

struct SportView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SportView()
        }
    }
}

