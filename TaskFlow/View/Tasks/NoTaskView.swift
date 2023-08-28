//
//  NoTaskView.swift
//  TaskFlow
//
//  Created by Dima on 24.08.2023.
//

import SwiftUI

struct NoTaskView: View {
    
    @State private var animate: Bool = false
    
    var body: some View {
            VStack(alignment: .center) {
                Spacer()
                Text("THERE ARE NO TASKS\nWOULD YOU LIKE\nTO ADD?")
                    .font(.title)
                    .foregroundColor(Color(.white))
                    .fontWeight(.bold)
                    .shadow(color: .black.opacity(0.1), radius: 5)
                    .multilineTextAlignment(.center)
                    Spacer()
                NavigationLink(destination: AddTaskView()) {
                    ZStack {
                        Circle()
                            .frame(width: 100)
                            .background(animate ? Color("AccentColor").opacity(0.7) :
                                            Color("SecondaryAccentColor").opacity(0.7))
                            .foregroundColor(.clear)
                            .clipShape(Circle())
                        Image(systemName: "plus")
                            .foregroundColor(Color(UIColor.secondarySystemBackground))
                            .font(.title)
                            .fontWeight(.medium)
                    }
                    .padding(.bottom)
                    .scaleEffect(animate ? 1.1 : 0.9)
                    .shadow(color: animate ? Color("AccentColor").opacity(0.7) :
                                Color("SecondaryAccentColor").opacity(0.7),
                            radius: animate ? 20 : 5,
                            x: 0,
                            y: animate ? 20 : 5)
                    .offset(y: animate ? -5 : 0)
                }
                .onAppear(perform: addAnimation)
            }
    }
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeInOut(duration: 2).repeatForever()) {
                animate.toggle()
            }
        }
    }
}

struct NoTaskView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Background()
            NoTaskView()
        }
    }
}
