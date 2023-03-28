//
//  BookingView.swift
//  TickeBoo
//
//  Created by Nishant Minerva on 28/03/23.
//

import SwiftUI

struct BookingView: View {
    @State var bookedSeats: [Int] = [1,10,25,30,45,59,60]
    @State var selectedSeats: [Int] = []
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
//                        SeatView(index: index)
                        SeatView(index: index, seat: seat, selectedSeats: $selectedSeats, bookedSeats: $bookedSeats)
                            .contentShape(Rectangle())
                            .onTapGesture{
//                                print(seat)
                                if selectedSeats.contains(seat) {
//                                    removing
                                    selectedSeats.removeAll{
                                        (removeSeat) -> Bool in
                                        return removeSeat == seat
                                    }
                                    return
                                }
//                                adding
                                selectedSeats.append(seat)
                            }
                        //        disable if seat is booked
                                .disabled(bookedSeats.contains(seat))
                    }
                })
                
                LazyVGrid(columns: columns, spacing: 13, content: {
                    
                    ForEach(rightSide,id: \.self){ index in
                        let seat = index >= 35 ? index - 2: index - 1
//                        SeatView(index: index)
                        SeatView(index: index, seat: seat, selectedSeats: $selectedSeats, bookedSeats: $bookedSeats)
                            .contentShape(Rectangle())
                            .onTapGesture{
//                                print(seat)
//                                checking and adding
                                if selectedSeats.contains(seat) {
//                                    removing
                                    selectedSeats.removeAll{
                                        (removeSeat) -> Bool in
                                        return removeSeat == seat
                                    }
                                    return
                                }
//                                adding
                                selectedSeats.append(seat)
                            }
                        //        disable if seat is booked
                                .disabled(bookedSeats.contains(seat))
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
    var seat: Int
    
    @Binding var selectedSeats: [Int]
    @Binding var bookedSeats: [Int]
    
    var body: some View{
        ZStack{
            
            RoundedRectangle(cornerRadius: 6)
//                .stroke(Color("button"))
//                .stroke(Color(.purple),lineWidth: 2)
                .stroke(bookedSeats.contains(seat) ? Color.gray : Color(.purple),lineWidth: 2)
                .frame(height: 30)
                .background(
                    selectedSeats.contains(seat) ? Color(.purple) : Color.clear
                )
//            Hiding Those Four Seats...
                .opacity(index == 0 || index == 28 || index == 35 || index == 61 ? 0 : 1)
            
            if bookedSeats.contains(seat) {
                Image(systemName: "xmark")
                    .foregroundColor(.gray)
            }
        }
////        disable if seat is booked
//        .disabled(bookedSeats.contains(seat))
    }
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        BookingView()
    }
}
