//
//  Home.swift
//  TickeBoo
//
//  Created by Nishant Minerva on 28/03/23.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            LazyVStack(spacing: 15,pinnedViews: [.sectionFooters], content: {
                HStack{
                    Button(action: {}, label: {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                    })

                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "bookmark")
                            .font(.title2)
                    })
                }
                .overlay(
                    Text("Detail Movie")
                        .font(.title2)
                        .fontWeight(.semibold)
                )
                .padding()
                .foregroundColor(.white)
                

                
                ZStack{
        //                Bottom Shadow ...
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white.opacity(0.2))
                        .padding(.horizontal)
                        .offset(y : 12)
                    
                    Image("poster")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
//                        .frame(width: getRect().width / 1.5 ,height: getRect().height / 2)
//                        .cornerRadius(15)
                }
                .frame(width: getRect().width / 1.5 ,height: getRect().height / 2)
                .cornerRadius(15)
                .padding(.top, 20)
            })
        })
        .background(Color(.blue).ignoresSafeArea())
//        .background(Color("bg").ignoresSafeArea())
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


// extending view to get RECT...

extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
