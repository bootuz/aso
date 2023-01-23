//
//  QuizView.swift
//  Aso
//
//  Created by Астемир Бозиев on 21.01.2023.
//

import SwiftUI

struct QuizView: View {
    @Environment(\.dismiss) var dismiss

    @State private var timeRemaining = 100 // Should be in settings
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("q’")
                    .foregroundColor(.white)
                    .font(.system(size: 200, weight: .bold, design: .rounded))
                    .shadow(radius: 10, x: 5, y: 5)
                    .padding(.bottom, 30)
                Spacer()
                HStack {
                    OptionView(option: "ა")
                        .padding(5)
                    OptionView(option: "ბ")
                        .padding(5)
                }
                HStack {
                    OptionView(option: "ყ")
                        .padding(5)
                    OptionView(option: "ლ")
                        .padding(5)

                }
                .padding(.bottom, 40)
            }
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   minHeight: 0,
                   maxHeight: .infinity)
            .background {
                LinearGradient(gradient: Gradient(colors: [Color("lightMauve"), Color("darkMauve")]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)

            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    ImageButtonView(icon: "xmark.circle.fill", size: 20) {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("\(timeRemaining)")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .bold))
                }
            }
            .onReceive(timer) { time in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                }
            }
        }
        .statusBarHidden()
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}
