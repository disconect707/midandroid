//
//  HobbyView.swift
//  MidtermProject
//
//  Created by dias on 12.03.2025.
//

import Foundation

import SwiftUI

struct HobbyView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Мои хобби")
                .font(.largeTitle)
                .fontWeight(.bold)

            HobbyItem(icon: "laptopcomputer", title: "Программирование",
                      description: "Люблю писать код.",
                      details: "Изучаю Swift, iOS-разработку, Next.js и Firebase. Разрабатываю Telegram-ботов и веб-приложения.")
            
            HobbyItem(icon: "music.note", title: "Музыка",
                      description: "Слушаю и играю.",
                      details: "Предпочитаю рок и электронику. Иногда играю на гитаре, а также пробую писать биты.")
            
            HobbyItem(icon: "airplane", title: "Путешествия",
                      description: "Изучаю новые места.",
                      details: "Посетил несколько стран, люблю горы и природу. Хочу увидеть Японию и США.")

            Spacer()
        }
        .padding()
    }
}


struct HobbyItem: View {
    var icon: String
    var title: String
    var description: String
    var details: String

    @State private var isExpanded = false
    var body: some View {
        VStack {
            HStack {
                Image(systemName: icon)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.blue)
                
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(description)
                        .font(.body)
                        .foregroundColor(.gray)
                }
                Spacer()

                Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                    .foregroundColor(.gray)
                    .rotationEffect(.degrees(isExpanded ? 180 : 0))
            }
            .padding()
            .onTapGesture {
                withAnimation(.spring()) {
                    isExpanded.toggle()
                }
            }

            if isExpanded {
                Text(details)
                    .font(.body)
                    .foregroundColor(.black)
                    .padding()
                    .transition(.opacity)
            }
        }
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}



struct HobbyView_Previews: PreviewProvider {
    static var previews: some View {
        HobbyView()
    }
}
