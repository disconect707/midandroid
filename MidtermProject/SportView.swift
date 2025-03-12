//
//  SportView.swift
//  MidtermProject
//
//  Created by dias on 12.03.2025.
//

import Foundation
import SwiftUI

struct SportView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Мои спортивные увлечения")
                .font(.largeTitle)
                .fontWeight(.bold)

            SportItem(icon: "figure.run", title: "Бег",
                      description: "Люблю бегать по утрам.",
                      details: "Бегаю 3 раза в неделю. Помогает держать тело в тонусе и разгружает голову.")
            
            SportItem(icon: "figure.pool.swim", title: "Плавание",
                      description: "Отличный вид спорта.",
                      details: "Плаваю в бассейне раз в неделю. Люблю воду и ощущение невесомости.")
            
            SportItem(icon: "dumbbell", title: "Тренировки",
                      description: "Работаю над собой.",
                      details: "Посещаю тренажерный зал. Основной упор на силу и выносливость.")

            Spacer()
        }
        .padding()
    }
}

struct SportItem: View {
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
                    .foregroundColor(.red)
                
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


struct SportView_Previews: PreviewProvider {
    static var previews: some View {
        SportView()
    }
}
