//
//  SwiftUIView.swift
//  MyGarden2
//
//  Created by Reema Alhabdan on 10/01/2023.
//

import SwiftUI
import RealmSwift

struct SwiftUIView: View {
    //    @EnvironmentObject var vm : ViewModel
    
    @State private var cardColor = Color("CardGreen")
    @State var PlantName = ""
    @State var WateringDay = ""
    @State var schedule = ["Low-water plants, every 2 weeks", "High-water plants, every week"]
    @State private var selectedSchedule = "Select Watering Schedule"
    @State var day = ["Sunday" ,"Monday" ,"Tuesday" ,"Wednesday" , "Thursday" , "Friday"]
    @State private var selectedDay = "Select Day"
    @State var d = ""
    @State var category = ""
    @ObservedResults(PlantList.self) var PlantLists
    
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationView{
            ZStack{
                Color("BacGreen")
                    .ignoresSafeArea()
                VStack{
                    VStack{
                        
                        Text("Enter Your Plant's Name:")
                            .font(.headline)
                            .frame(maxWidth: 365, alignment: .leading)
                        TextField("Plant Name", text: $PlantName)
                            .textFieldStyle(.roundedBorder)
                            .opacity(0.4)
                            .frame(width: 365)
                        Text("Choose Your Plant's Category:")
                            .font(.headline)
                            .frame(maxWidth: 365, alignment: .leading)
                        
                        HStack{
                            Button{
                                category = "CardGreen"
                                
                                d = NSLocalizedString("Regular", comment: "")
                               
                            }label: {
                                ZStack{
                                    
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color("CardGreen"))
                                        .frame(width: 100, height: 95)
                                    Image("Monesera")
                                        .resizable()
                                        .frame(width: 150, height: 150)
                                    
                                }}
                            HStack{
                                Button{
                                    category = "CardOrange"
                                    d = NSLocalizedString("Cactus", comment: "")
                                    
                                    
                                } label: {
                                    ZStack{
                                        
                                        
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color("CardOrange"))
                                            .frame(width: 100, height: 95)
                                        
                                        Image("Cactus")
                                            .resizable()
                                        .frame(width: 100, height: 100)}
                                }}
                            Button{
                                category = "CardPink"
                                d = NSLocalizedString("Flowers", comment: "")
                                //= "Flowers"
                            }label: {
                                ZStack{
                                    
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color("CardPink"))
                                        .frame(width: 100, height: 95)
                                    
                                    
                                    Image("Flora")
                                        .resizable()
                                    .frame(width: 150, height: 130)}
                            }
                        }

                        Text(d)
                            .font(.subheadline)
                            .padding()
                        
                        Text("Choose Your Watering Schedule:")
                            .font(.headline)
                            .padding(.trailing, 100)
                        Picker("Please Choose Your Watering Schedule", selection: $schedule)
                        {
                            ForEach(schedule, id: \.self){
                                Text($0)
                                
                            }
                        }.padding(.trailing, 90)
                            .accentColor(.white)
                            .foregroundColor(.white)
                        Text("Choose Your Watering Day:")
                        
                            .font(.headline)
                            .padding(.trailing,145)
                        Picker("Please Choose a Watering Day:", selection: $day){
                            ForEach(day, id: \.self){
                                Text($0)
                                
                                
                            }
                        }
                        .accentColor(.white)
                        .frame(width: 100, height: 30)
                        .padding(.trailing,280)}
                    VStack{
                        Button{
                            let PlantList = PlantList()
                            PlantList.PlantName = PlantName
                            PlantList.WateringDay = selectedDay
                            PlantList.Schedule = selectedSchedule
                            PlantList.PlantCategory = category
                            
                            $PlantLists.append(PlantList)
                            dismiss()
                        }label: {
                            
                            ZStack {
                                Color("CardGreen")
                                
                                    .frame(width: 100, height: 50)
                                    .opacity(0.9)
                                    .buttonStyle(.bordered)
                                    .cornerRadius(10)
                                Text("Add Plant")
                                    .foregroundColor(.black)
                                    .bold()
                                .buttonStyle(.bordered)}
                        }
                        
                    }
                }
            }
            
        }
        
    }
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }}

