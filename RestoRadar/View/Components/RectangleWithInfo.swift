import SwiftUI

struct RectangleWithInfo: View {
    let image:String
    let width:CGFloat
    let height:CGFloat
    let nombre:String
    let direccion:String
    let reviews:Int
    let score:Int
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .frame(width: width, height: height)
        VStack {
            //Nombre del restaurant
            HStack {
                Text(nombre)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.leading, 20)
            
            //Direccion del restaurant
            HStack {
                Text(direccion)
                Spacer()
            }
            .padding(.leading, 20)
            
            HStack {
                //Puntuacion del restaurant
                if score >= 1 {
                    Image(systemName: "star.fill")
                } else {
                    Image(systemName: "star")
                }
                
                if score >= 2 {
                    Image(systemName: "star.fill")
                } else {
                    Image(systemName: "star")
                }
                
                if score >= 3 {
                    Image(systemName: "star.fill")
                } else {
                    Image(systemName: "star")
                }
                
                if score >= 4 {
                    Image(systemName: "star.fill")
                } else {
                    Image(systemName: "star")
                }
                
                //Numero de reviews
                Text("\(reviews) reviews")
                    .font(.subheadline)
                    .foregroundColor(Color.secondary)
                Spacer()
            }
            .padding(.leading, 20)
        }
    }
}
