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
                
                Section(footer: FooterView()) {
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
                    
                    VStack(alignment: .leading, content: {
                        // For JOKE 3020...
                        Text("No Time To Die 3020")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("Director: Cary Joji Fukunage | 4")
                            .foregroundColor(.white)
                            .overlay(
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                    .offset(x: 35, y: -2)
                                , alignment: .trailing
                            )
                        
                        // Genres....
                        // Creating Simple Chips View...
                        // Adapting will place how many views can possible into a row with given minimum space...
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], alignment: .leading, content: {
                            ForEach(genre,id: \.self) {
                                genreText in
                                Text(genreText)
                                    .font(.caption)
                                    .padding(.vertical, 10)
                                    .frame(width: .infinity)
                                    .foregroundColor(.white)
                                    .background(Color.white.opacity(0.08))
                                    .clipShape(Capsule())
                            }
                            
                        })
                        .padding(.top, 20)
                        
                        Text("Synopsis")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical)
                        
                        Text(synopsis)
                            .foregroundColor(.white)
                    })
                    .padding(.top, 55)
                    .padding(.horizontal)
                    .padding(.leading, 10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            })
        })
        .background(Color(.black).ignoresSafeArea())
//        .background(Color("bg").ignoresSafeArea())
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

// Footer Button...

struct FooterView: View {
    var body: some View{
        NavigationLink(
            destination: Text("Destination"), label: {
                Text("Buy Tickets")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(width: getRect().width / 2)
//                    .background(Color("button"))
                    .background(Color(.purple))
                    .cornerRadius(15)
            })
        .shadow(color: Color.white.opacity(0.15), radius: 5, x: 5, y:5)
        .shadow(color: Color.white.opacity(0.15), radius: -5, x: 5, y:-5)
    }
}

// extending view to get RECT...

extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
