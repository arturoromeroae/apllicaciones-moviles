//
//  HomeView.swift
//  RestoRadar
//
//  Created by User on 14/10/23.
//

import SwiftUI

struct HomeView: View {
    @State var find: String = ""
    @State var offsetY: CGFloat = 0
    var body: some View {
            ScrollView{
                HStack {
                    Image("logo-icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                    Text(formattedDate())
                }// End HStack
                
                TextField("Find your food",text: $find)
                    .autocapitalization(.none)
                    .modifier(AuthTextModifier())
                VStack {
                    //Imagen principal con rectangulo dentro
                    Image("restaurant-vertical")
                        .resizable()
                        .scaledToFit()
                        .overlay(
                            //Rectangulo blanco con contenido
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 300, height: 160)
                                .foregroundColor(Color.white)
                                .padding(.top, -230)
                                .overlay(
                                    VStack {
                                        //Titulo dentro del rectangulo
                                        HStack {
                                            Text("Featured\nRestaurant")
                                                .fontWeight(.bold)
                                                .font(.system(size: 30))
                                                .padding(.top, -200)
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                                .padding(.top, -170)
                                        }// End HStack
                                        .padding(20)
                                        
                                        //Texto con icono dentro del rectangulo
                                        HStack {
                                            Image(systemName: "rosette")
                                                .foregroundColor(Color.brown)
                                                .padding(.top, -142)
                                            Text("Choice of our community")
                                                .padding(.top, -140)
                                                .font(.subheadline)
                                                .fontWeight(.bold)
                                                .foregroundColor(Color.brown)
                                            Spacer()
                                        }// End HStack
                                        .padding(.leading, 20)
                                    }// End VStack
                                )// End overlay RoundedRectangle
                        )// End overlay Image
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .padding(20)
                    //Titulo de restaurantes cercanos con icono
                    HStack {
                        Image(systemName: "pin")
                        Text("Restaurants near you")
                            .fontWeight(.bold)
                            .font(.system(size: 25))
                        Spacer()
                    }
                    .padding(.leading, 20)
                    
                    //Feed de restaurantes
                    RectangleWithInfo(image: "maras-restaurant", width: 350, height: 200, nombre: "Maras Restaurant", direccion: "Av. Brasil 209, Jesus Maria", reviews: 20, score: 2)
                    RectangleWithInfo(image: "restaurant-2", width: 350, height: 200, nombre: "Tanta", direccion: "Av. Salaverry 159, Jesus Maria", reviews: 203, score: 5)
                    RectangleWithInfo(image: "restaurant-3", width: 350, height: 200, nombre: "Sofa Cafe", direccion: "Jr. Lima 209, San Miguel", reviews: 50, score: 1)
                    RectangleWithInfo(image: "restaurant-4", width: 350, height: 200, nombre: "Granja Azul", direccion: "Av. Garzón 29, Miraflores", reviews: 151, score: 4)
                    RectangleWithInfo(image: "maras-restaurant", width: 350, height: 200, nombre: "Maras Restaurant", direccion: "Av. Brasil 209, Jesus Maria", reviews: 20, score: 2)
                }// End VStack
            }// End ScrollView
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
    }
    
    func formattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM d" // Formato de fecha deseado
        return dateFormatter.string(from: Date())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
