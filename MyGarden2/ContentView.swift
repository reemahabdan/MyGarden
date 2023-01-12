//
//  ContentView.swift
//  MyGarden2
//
//  Created by Reema Alhabdan on 09/01/2023.
//

import SwiftUI
import RealmSwift
import Accessibility

struct ContentView: View {
    @State private var showImage = false
    @State private var backgroundColor = Color("")
    @State private var isPresented: Bool = false
    @State  private var cardColor = Color("")
    @State  private var miniCardColor = Color("")
    @State  private var img = ""
    @State private var progress = 1.0
    @State private var count = 20
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var showingSheet: Bool = false
    @ObservedResults(PlantList.self) var PlantLists
    @State var selectedItem : PlantList
    var body: some View {
        
        NavigationView{
            ZStack{
                Rectangle()
                    .foregroundColor(colorBac(category:  selectedItem.PlantCategory))
                //    Color(color(category:  selectedItem.PlantCategory))
                    .ignoresSafeArea()
                
                VStack{
                    HStack{
                        GeometryReader { geo in
                            ZStack{
                                
                                Circle()
                                    .frame(width: 70,height: 90)
                                    .foregroundColor(.white)
                                
                                
                                
                                
                                Circle()
                                    .fill(Color("b"))
                                    .frame(width: 57, height: 57)
                                
                                
                                Image(systemName: "cloud.drizzle")
                                    .foregroundColor(.white)
                                    .accessibility(label: Text("I watered my plant"))
                                    .onTapGesture {
                                        self.showImage = true
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                            self.showImage = false
                                        }
                                    }
                                Circle()
                                    .trim(from: 0, to: progress)
                                    .stroke(Color.blue.opacity(0.7), lineWidth: 9)
                                    .frame(width: 70,height: 90)
                                
                            }
                            .padding(.leading, 50.0)
//                                .frame(height: geo.size.width)
//                                .rotationEffect(.degrees(-0))
                                .animation(.spring(), value: progress)
                                .overlay(
                                    Text("")
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
                            
                        Spacer()
 .frame(width: 5)
                            ZStack{
                                Circle()
                                    .frame(width: 70,height: 90)
                                    .foregroundColor(.white)
                                Circle()
                                    .fill(Color("b"))
                                    .frame(width: 57, height: 57)
                                Image("Fertilizer")
                                    .onTapGesture {
                                        self.showImage = true
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                            self.showImage = false
                                        }
                                    }
                                
                            }
                            .padding(.trailing, 50.0)
                        }.padding()
                        ZStack{
                            RoundedRectangle(cornerRadius: 25.0)
                                .fill(color(category: selectedItem.PlantCategory))
                                .frame(width: 301, height: 260.85)
                                .padding(.horizontal)
                                .padding(.bottom,100)
                            Ellipse()
                                .fill(.black)
                                .frame(width: 100, height: 50)
                                .opacity(0.4)
                                .padding(100)
                                .position(x: 210, y: 345)
                                .blur(radius: 10)
                            
                            
                            Image(Img(category:  selectedItem.PlantCategory))
                                .resizable()
                                .frame(width: 340, height: 400)
                            
                            
                            
                        }
                        
                        
                        ScrollView(.horizontal){
                            HStack{
                                ForEach(PlantLists, id: \.id) { PlantList in
                                    VStack{
                                        ZStack {
                                            
                                            RoundedRectangle(cornerRadius: 20)
                                                .fill(color(category:  PlantList.PlantCategory))
                                                .frame(width: 100)
                                            
                                                .onTapGesture {
                                                    self.img = Img(category:  PlantList.PlantCategory)
                                                }
                                            
                                            Image(Img(category:  PlantList.PlantCategory))
                                                .resizable()
                                                .frame(width: 100, height: 100)
                                            
                                        }
                                        
                                        Text(PlantList.PlantName).foregroundColor(.black)
                                    }.onTapGesture {
                                        selectedItem = PlantList
                                    }
                                    
                                }
                                
                            }
                            .frame(height: 150)
                            if PlantLists.isEmpty{
                                Text("No Plants added!")
                            }
                            
                        }
                        
                        
                        .padding()
                        .navigationTitle("My Garden")
                        .foregroundColor(.white)
                        
                        
                    }
                    
                    
                    .toolbar {
                        
                        Button{
                            showingSheet.toggle()
                        } label: {
                            Label("",systemImage: "plus.circle")
                                .foregroundColor(.white)
                                .accessibility(label: Text("Add plant"))
                        }
                        .sheet(isPresented: $showingSheet, content:{
                            SwiftUIView()
                        })
                        
                        .presentationDetents([.medium])
                        
                        
                        
                    }
                    if showImage {
                        LottieView(lottieFile: "confetti")
                            .frame(width: 600, height: 600)
                        
                    }
                }
            }
        }
        
        
        func color(category:String)-> Color{
            switch category{
            case "CardOrange":
                return Color("CardOrange")
                
            case "CardGreen":
                return Color("CardGreen")
            default:
                return Color("CardPink")        }
        }
        
        func colorBac(category:String)-> Color{
            switch category{
            case "CardOrange":
                return Color("BacOrange")
                
            case "CardGreen":
                return Color("BacGreen")
            default:
                return Color("BacPink")        }
        }
        
        func Img(category:String)-> String{
            switch category{
            case "CardOrange":
                return "Cactus"
                
            case "CardGreen":
                return "Monesera"
            default:
                return "Flora"       }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(selectedItem: .init())
        
    }
}


