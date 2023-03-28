//
//  BookingView.swift
//  TickeBoo
//
//  Created by Nishant Minerva on 28/03/23.
//

import SwiftUI

struct BookingView: View {
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false, content: {
            HStack{
                Button(action: {}, label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.white)
                })
                Spacer()
            }
            .overlay(
            
            Text("Select Seats")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            )
            .padding()
//            Curve Or Thatre View...
            GeometryReader{
                reader in
//                To get Width...
                let width = reader.frame(in: .global).width
                
                Path{
                    path in
//                    creating simple curve...
                    path.move(to: CGPoint(x:0,y:50))
                    path.addCurve(to: CGPoint(x: width, y: 50), control1: CGPoint(x: width / 2, y: 0), control2: CGPoint(x: width / 2, y: 0))
                }
//                .fill(Color.blue)
                .stroke(Color.gray, lineWidth: 1.5)
            }
//            Maxheigth...
            .frame(height: 50)
            .padding(.top,20)
            .padding(.horizontal,35)
//            Grid View Of Seats...
//             total seats = 60...
//            Mock or Fake Seats = 4 To Adjust Space...
            let totalSeats = 60 + 4
            let leftSide = 0..<totalSeats/2
            let rightSide = totalSeats/2..<totalSeats
            
            HStack(spacing: 30) {
                let columns = Array(repeating: GridItem(.flexible(), spacing: 10), count: 4)
                LazyVGrid(columns: columns, spacing: 13, content: {
                    
                    ForEach(leftSide,id: \.self){ index in
//                        Getting Correct Seats...
                        let seat = index >= 29 ? index - 1: index
                        SeatView(index: index)
                            .contentShape(Rectangle())
                            .onTapGesture{
                                print(seat)
                            }
                    }
                })
                
                LazyVGrid(columns: columns, spacing: 13, content: {
                    
                    ForEach(rightSide,id: \.self){ index in
                        let seat = index >= 35 ? index - 2: index - 1
                        SeatView(index: index)
                            .contentShape(Rectangle())
                            .onTapGesture{
                                print(seat)
                            }
                    }
                })

            }
            .padding()
            .padding(.top,30)
        })
//        .background(Color("bg").ignoresSafeArea())
        .background(Color(.black).ignoresSafeArea())
    }
}

struct SeatView: View {
    var index: Int
    var body: some View{
        ZStack{
            
            RoundedRectangle(cornerRadius: 6)
//                .stroke(Color("button"))
                .stroke(Color(.purple),lineWidth: 2)
                .frame(height: 30)
//            Hiding Those Four Seats...
                .opacity(index == 0 || index == 28 || index == 35 || index == 61 ? 0 : 1)
        }
    }
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        BookingView()
    }
}
