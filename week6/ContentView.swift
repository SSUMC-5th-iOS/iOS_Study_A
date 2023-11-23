//
//  ContentView.swift
//  week6
//
//  Created by 박현수 on 2023/11/21.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        
        let affordableView = BaedalView(viewTitle: "알뜰배달", viewContent: "쿠폰 골라 받기")
        let baedalView = BaedalView(viewTitle: "배달", viewContent: "세상은 넓고\n맛집은 많다")
        let storeView = BaedalView(viewTitle: "배민스토어", viewContent: "배달은 지금\n옵니다")
        let menuView = MenuView()
        let sinjeonView = SinJeonView()
        
        TabView {
            ZStack {
                
                Color(.systemGray6)
                
                VStack {
                    
                    ZStack {
                        
                        Color(UIColor(hex: 0x48D1CC))
                            .frame(height: UIScreen.main.bounds.height / 6)
                            .cornerRadius(20)
                        
                        VStack {
                            
                            HStack {
                                Button {} label: {Label("우리집", systemImage: "chevron.down").padding(.leading).foregroundColor(Color.white)}
                                Spacer()
                                Button {} label: {Image(systemName: "square.grid.2x2").foregroundColor(Color.white)}
                                Button {} label: {Image(systemName: "bell").foregroundColor(Color.white)}
                                Button {} label: {Image(systemName: "cart").padding(.trailing).foregroundColor(Color.white)}
                            }.padding(.top, 50)
                            SearchBar()
                                .padding(.horizontal)
                                .padding(.bottom, 10)
                        }
                        
                    }.ignoresSafeArea()
                    
                    ZipCokView()
                        .frame(width: UIScreen.main.bounds.width * 6 / 7,
                               height: UIScreen.main.bounds.height / 7)
                        .background(Color.white)
                        .cornerRadius(10)
                    
                    HStack(spacing: 20) {
                        
                        ZStack {
                            Color.white
                                .cornerRadius(10)
                            affordableView
                        }.frame(width: UIScreen.main.bounds.width / 4, height: UIScreen.main.bounds.height / 8)
                        
                        ZStack {
                            Color.white
                                .cornerRadius(10)
                            baedalView
                        }.frame(width: UIScreen.main.bounds.width / 4, height: UIScreen.main.bounds.height / 8)
                        
                        ZStack {
                            Color.white
                                .cornerRadius(10)
                            storeView
                        }.frame(width: UIScreen.main.bounds.width / 4, height: UIScreen.main.bounds.height / 8)
                    }.padding(.top, 20)
                    
                    menuView.background(Color.white)
                        .cornerRadius(15)
                        .frame(width: UIScreen.main.bounds.width * 6 / 7)
                        .padding(.top, 20)
                    
                    sinjeonView.background(Color.white)
                        .cornerRadius(15)
                        .frame(width: UIScreen.main.bounds.width * 6 / 7)
                        .padding(.top, 20)
                    Spacer()

                }
            }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("검색")
                }
            Text("찜")
                .tabItem {
                    Image(systemName: "heart")
                    Text("찜")
                }
            Text("배민")
                .tabItem {
                    Image(systemName: "circle.fill")
                    Text("배민")
                }
            Text("주문내역")
                .tabItem {
                    Image(systemName: "creditcard")
                    Text("주문내역")
                }
            Text("My배민")
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("My배민")
                }
        }.background(Color.white)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension UIColor {
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((hex >> 16) & 0xFF) / 255.0,
            green: CGFloat((hex >> 8) & 0xFF) / 255.0,
            blue: CGFloat(hex & 0xFF) / 255.0,
            alpha: alpha
        )
    }
}

struct SearchBar: View {
    @State private var searchText: String = ""

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.white)
            TextField("찾으시는 맛집이 있으신가요?", text: $searchText)
                .foregroundColor(.gray)
                .padding(8)
                .background(Color.white)
                .cornerRadius(8)
                .padding(.trailing, 8)
        }
    }
}

struct ZipCokView: View {
    var body: some View {
        HStack {
            Text("집콕러세요?")
            Text("30% 쿠폰")
                .bold()
            Text("드려요!")
        }
    }
}

struct BaedalView: View {
    let viewTitle: String
    let viewContent: String

    init(viewTitle: String, viewContent: String) {
        self.viewTitle = viewTitle
        self.viewContent = viewContent
    }

    var body: some View {
        VStack {
            Text(viewTitle).bold()
            Text(viewContent)
        }
    }
}

struct MenuView: View {
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Text("대용량특가").bold()
                Text("많이 살수록 더 저렴하죠")
                Spacer()
                Image(systemName: "chevron.forward")
            }.padding(20)
            HStack(spacing: 20) {
                Button(action: {}) {
                    VStack {
                        Image(systemName: "trophy.circle")
                        Text("인기")
                    }
                }.background(Color.white)
                    .cornerRadius(5)
                Button(action: {}) {
                    VStack {
                        Image(systemName: "tag.circle")
                        Text("신상품")
                    }
                }.background(Color.white)
                    .cornerRadius(5)
                Button(action: {}) {
                    VStack {
                        Image(systemName: "flame.circle")
                        Text("특가")
                    }
                }.background(Color.white)
                    .cornerRadius(5)
                Button(action: {}) {
                    VStack {
                        Image(systemName: "bag.circle")
                        Text("쌀 잡곡")
                    }
                }.background(Color.white)
                    .cornerRadius(5)
                Button(action: {}) {
                    VStack {
                        Image(systemName: "bathtub")
                        Text("화장지")
                    }
                }.background(Color.white)
                    .cornerRadius(5)
            }.padding(.horizontal, 20)
            HStack(spacing: 20) {
                Button(action: {}) {
                    VStack {
                        Image(systemName: "trophy.circle")
                        Text("인기")
                    }
                }.background(Color.white)
                    .cornerRadius(5)
                Button(action: {}) {
                    VStack {
                        Image(systemName: "tag.circle")
                        Text("신상품")
                    }
                }.background(Color.white)
                    .cornerRadius(5)
                Button(action: {}) {
                    VStack {
                        Image(systemName: "flame.circle")
                        Text("특가")
                    }
                }.background(Color.white)
                    .cornerRadius(5)
                Button(action: {}) {
                    VStack {
                        Image(systemName: "bag.circle")
                        Text("쌀 잡곡")
                    }
                }.background(Color.white)
                    .cornerRadius(5)
                Button(action: {}) {
                    VStack {
                        Image(systemName: "bathtub")
                        Text("화장지")
                    }
                }.background(Color.white)
                    .cornerRadius(5)
            }.padding(.horizontal, 20)
                .padding(.top, 20)
        }
    }
}

struct SinJeonView: View {
    var body: some View {
        VStack {
            Text("신전떡볶이 신메뉴 출시 기념").frame(maxWidth: UIScreen.main.bounds.width * 6 / 7)
            Text("신전떡볶이 특급 할인")
                .bold().frame(maxWidth: UIScreen.main.bounds.width * 6 / 7)
            Text("최대 7000원 할인").frame(maxWidth: UIScreen.main.bounds.width * 6 / 7)
        }.padding(.horizontal, 20)
    }
}
