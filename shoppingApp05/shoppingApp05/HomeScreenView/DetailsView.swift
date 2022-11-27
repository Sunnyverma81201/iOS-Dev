//
//  DetailsView.swift
//  shoppingApp05
//
//  Created by Apoorv Verma on 15/10/22.
//

import SwiftUI

struct RoundedCornerShape: Shape {
    let corners: UIRectCorner
    let radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct Counter: View {
    @State var count = 0
    var body: some View {
        HStack(spacing: 25) {
            Button {
                if count < 10 {
                    count += 1
                }
            } label: {
                Image(systemName: "plus")
            }
            Text("\(count)")
                .font(.title2)
            Button {
                if count != 0 {
                    count -= 1
                }
            } label: {
                Image(systemName: "minus")
            }
        }
        .foregroundColor(.black)
        .frame(width: 130, height: 50)
        .background(Color("bgColor").opacity(0.15))
        .cornerRadius(12)
        .padding(.horizontal)
    }
}

struct DetailsView: View {
    
    @State var fruit: fruitTitle
    
    var body: some View {
        VStack(alignment: .leading, spacing: 25){
            Image("bg")
                .resizable()
                .edgesIgnoringSafeArea(.top)
                .clipShape(RoundedCornerShape.init(corners: [.bottomLeft, .bottomRight], radius: 50))
                .frame(width: .infinity, height: .infinity, alignment: .top)
                .edgesIgnoringSafeArea(.all)
                .shadow(color: .gray, radius: 5, x: 5, y: 5)
                .overlay(
                    Image("\(fruit.rawValue)")
                        .resizable()
                        .frame(width: 250, height: 250, alignment: .center)
                        .offset(y:30)
                        .shadow(color: .gray, radius: 5, x: 5, y: 5)
                )
            Spacer()
            Text("\(fruit.rawValue) - Medium")
                .fontWeight(.medium)
                .font(.title)
                .padding(.horizontal)
                .textCase(.uppercase)
            Text ("Each (500g - 700g)")
                .padding(.horizontal)
            Text ("Organic agriculture is intended to produce high quality, nutritious food that contributes to preventive health care and well-being. In view of this, it avoids the use of fertilizers, pesticides, animal drugs and food additives that may have adverse health effects.")
                .font(.body)
                .fontWeight(.regular)
                .multilineTextAlignment(.leading)
                .lineLimit(6)
                .padding(.horizontal)
            HStack{
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color("bgColor"))
                    .opacity(0.15)
                    .overlay(
                        Image(systemName: "hourglass")
                    )
                    .font(.system(size: 40))
                    .frame(width: 50, height: 50)
                
                VStack(alignment: .leading, spacing: 5){
                    Text("Delivery Time").font(.title3)
                    Text("25 - 30 Min").font(.subheadline).opacity(0.8)
                }
            }.padding(.horizontal)
            
            HStack{
                Text("$1.99")
                    .fontWeight(.medium)
                    .font(.title2)
                    .padding(.horizontal)
                Spacer()
                Counter()
            }
            
            Image("bg")
                .resizable()
                .frame(width: 350,height: 50, alignment: .center)
                .cornerRadius(15)
                .padding(.horizontal)
                .shadow(color: .gray, radius: 5, x: 5, y: 5)
                .overlay {
                    Text("Add to Cart")
                        .font(.system(.title3))
                        .fontWeight(.medium)
                }
            
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(fruit: .orange)
    }
}
