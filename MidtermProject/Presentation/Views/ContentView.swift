import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Обо мне")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                NavigationLink(destination: HobbyView()) {
                    MenuItem(icon: "star.fill", title: "Мои хобби")
                }

                NavigationLink(destination: SportView()) {
                    MenuItem(icon: "figure.walk", title: "Мои спортивные увлечения")
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Главная")
        }
    }
}

struct MenuItem: View {
    var icon: String
    var title: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.blue)
            
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)

            Spacer()
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
