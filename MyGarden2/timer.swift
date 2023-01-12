//
//  Timer.swift
//  MyGarden2
//
//  Created by Reema Alhabdan on 12/01/2023.
//

import SwiftUI

struct timer: View {
    @State private var progress = 1.0
    @State private var count = 10
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 15) {
                ZStack {
                    Circle()
                        .fill(.white.opacity(0.03))
                        .padding(-40)

                    Circle()
                        .trim(from: 0, to: progress)
                        .stroke(Color.pink, lineWidth: 10)
                        .blur(radius: 15)
                        .padding(-2)
                    
                    Circle()
                        .trim(from: 0, to: 1)
                        .stroke(Color.pink, lineWidth: 10)
                        .blur(radius: 15)
                        .padding(-2)

                    Circle()
                        .fill(.white)

                     Circle()
                        .trim(from: 0, to: progress)
                        .stroke(Color.orange.opacity(0.7), lineWidth: 10)
                    
                    Image(systemName: "cloud.drizzle")

                     knobView
                }
                .padding()
                .frame(height: geo.size.width)
                .rotationEffect(.degrees(-90))
                .animation(.spring(), value: progress)
                .overlay(
                    Text("\(count)")
                    .font(.largeTitle)
                )
                .onReceive(timer) { _ in
                    progress -= 0.1
                    count -= 1
                    if progress <= 0.0 || count <= 0 {
                        timer.upstream.connect().cancel()
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
        .padding(50)
    }
    
    private var knobView: some View {
        GeometryReader { knobGeo in
            Circle()
                .fill(Color.orange)
                .frame(width: 25, height: 25)
                .overlay(
                    Circle()
                        .fill(.white)
                        .padding(5)
                )
                .frame(width: knobGeo.size.width, height: knobGeo.size.height, alignment: .center)
        }
    }
}

struct timer_Previews: PreviewProvider {
    static var previews: some View {
        timer()
    }
}
