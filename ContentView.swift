//
//  ContentView.swift
//  MyGarden2
//
//  Created by Reema Alhabdan on 09/01/2023.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    //    @EnvironmentObject var vm : ViewModel
    @State private var backgroundColor = Color("BacGreen")
    @State private var isPresented: Bool = false
    @State  private var cardColor = Color("CardGreen")
    @State  private var miniCardColor = Color(.black)
    @State  private var img = ""
    

    // cardcolor was private var
    @State private var showingSheet: Bool = false
    //    @State private var plantname: String
    @ObservedResults(PlantList.self) var PlantLists
    var body: some View {
        
        NavigationView{
            ZStack{
                Color("BacGreen")
                    .ignoresSafeArea()
                
                VStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 25.0)
                            .fill(cardColor)
                            .frame(width: 301, height: 260.85)
                            .padding(.horizontal)
                            .padding(.bottom,100)
                        
//                        Image(Category)
//                            .resizable()
//                            .frame(width:320, height: 320 )
                }
            
                       
                        ScrollView(.horizontal){
                            HStack{
                            ForEach(PlantLists, id: \.id) { PlantList in
                                VStack{
                                    ZStack {
                                        // go here
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(color(category:  PlantList.PlantCategory))
                                        .frame(width: 100)
///?????
                                        .onTapGesture {
                                            self.img = Img(category:  PlantList.PlantCategory)
                                        }
                                        
                                        Image(Img(category:  PlantList.PlantCategory))
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                    }
                                    // Text(PlantList.PlantCategory)
                                    Text(PlantList.PlantName).foregroundColor(.black)
                                }
                               
                            }
                           // .onDelete(perform: $PlantLists.remove)
                        }
                            .frame(height: 150)
                        if PlantLists.isEmpty{
                            Text("No Plants added!")
                        }
//
//                        List{
//                            ForEach(PlantLists, id: \.id) { PlantList in
//                                HStack(alignment: .bottom){
//                                    Text(PlantList.PlantCategory)
//                                    Text(PlantList.PlantName)
//
//                                        .opacity(0.4)
//                                }
                                
//                            }.onDelete(perform: $PlantLists.remove)
                        }
             //       Image(Img(category: PlantList.PlantCategory))
                 //       .resizable()
                    
//                    Text("uyfiutfoygigupiugy")
//                     .position(x: 200 ,y: -400)
//
                    
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
                        }
                        .sheet(isPresented: $showingSheet, content:{
                            SwiftUIView()
                        })
                        
                        .presentationDetents([.medium])
                        
                        
                        
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
    //color(category:  PlantList.PlantCategory)
    //Img(category:  PlantList.PlantCategory)
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
            ContentView()
            
        }
    }


