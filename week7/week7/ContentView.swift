//
//  ContentView.swift
//  week7
//
//  Created by 박현수 on 2023/11/27.
//

import SwiftUI

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let location: String
    let date: String
    let price: String
}

struct ProductView: View {
    let product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    var body: some View {
        HStack{
            Image(product.image)
            VStack{
                Text(product.name)
                HStack {
                    Text(product.location)
                    Text(product.date)
                }
            }
            
        }
    }
}

struct IceTrayProductView: View {
    var body: some View {
        VStack {
            Image("icetray")
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            HStack {
                Text("얼음틀")
                Spacer()
            }
            HStack {
                Text("3,000원").font(.headline)
                Spacer()
            }
        }
    }
}

struct ProductScrollView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text("시원한 여름 간식의 계절").font(.headline)
                Spacer()
                Image(systemName: "chevron.right")
            }
        }
        ScrollView(.horizontal) {
            HStack {
                ForEach(0..<20) { _ in
                    IceTrayProductView()
                        .padding(5)
                }
            }
        }.listRowSeparator(.hidden, edges: .top)
    }
}

struct HomeView: View {
    var products = [
        Product(name: "에어팟맥스 블루", image: "blue", location: "서울특별시 양천구", date: "3일 전", price: "300,000원"),
        Product(name: "에어팟맥스 실버", image: "silver", location: "서울특별시 동작구", date: "6일 전", price: "300,000원"),
        Product(name: "에어팟맥스 스페이스그레이", image: "spaceGray", location: "서울특별시 양천구", date: "3일 전", price: "300,000원"),
        Product(name: "에어팟맥스 핑크", image: "pink", location: "서울특별시 동작구", date: "6일 전", price: "300,000원"),
        Product(name: "에어팟맥스 그린", image: "green", location: "서울특별시 양천구", date: "3일 전", price: "300,000원"),
        Product(name: "에어팟맥스 실버", image: "silver", location: "서울특별시 동작구", date: "6일 전", price: "300,000원"),
        Product(name: "에어팟맥스 스페이스그레이", image: "spaceGray", location: "서울특별시 양천구", date: "3일 전", price: "300,000원"),
        Product(name: "에어팟맥스 핑크", image: "pink", location: "서울특별시 동작구", date: "6일 전", price: "300,000원"),
        Product(name: "에어팟맥스 그린", image: "green", location: "서울특별시 양천구", date: "3일 전", price: "300,000원"),
        Product(name: "에어팟맥스 블루", image: "blue", location: "서울특별시 동작구", date: "6일 전", price: "300,000원")
    ]
    
    var body: some View {
        List(products.indices) { index in
            HStack {
                Image(products[index].image)
                    .resizable()
                    .frame(width: 100, height: 100)
                VStack{
                    HStack {
                        Text(products[index].name).padding(.leading)
                        Spacer()
                    }
                    HStack {
                        Text(products[index].location).padding(.horizontal)
                            .foregroundColor(Color.gray)
                            .font(.system(size: 15))
                        Text(products[index].date)
                            .foregroundColor(Color.gray)
                            .font(.system(size: 15))
                        Spacer()
                    }
                    HStack {
                        Text(products[index].price).font(.headline).padding(.leading)
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Image(systemName: "message")
                        Text("5")
                        Image(systemName: "heart")
                        Text("23")
                    }.foregroundColor(Color.gray)
                }
                
            }
            if index == 2 {
                ProductScrollView()
            }
        }.listStyle(PlainListStyle())
        
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("홈")
                    }
                Text("동네생활")
                    .tabItem {
                        Image(systemName: "doc")
                        Text("동네생활")
                    }
                Text("내 근처")
                    .tabItem {
                        Image(systemName: "mappin.and.ellipse")
                        Text("내 근처")
                    }
                Text("채팅")
                    .tabItem {
                        Image(systemName: "message")
                        Text("채팅")
                    }
                Text("나의 당근")
                    .tabItem {
                        Image(systemName: "person")
                        Text("나의 당근")
                    }
            }.navigationBarTitle("", displayMode: .inline)
                .navigationBarItems(
                                leading:
                                    HStack {
                                        Text("광명동")
                                            .font(.headline)
                                            .foregroundColor(.black)
                                            .padding(.leading, 5)
                                        Image(systemName: "chevron.down")
                                            .foregroundColor(.black)
                                    },
                                trailing:
                                    HStack {
                                        Image(systemName: "line.3.horizontal")
                                        Image(systemName: "magnifyingglass")
                                        Image(systemName: "bell")
                                    }
                                    .foregroundColor(.black)
                                    .padding(.horizontal, 5)
                            ).accentColor(.black)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
