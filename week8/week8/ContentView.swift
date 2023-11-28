//
//  ContentView.swift
//  week8
//
//  Created by 박현수 on 2023/11/28.
//

import SwiftUI

class TextUpdater: ObservableObject {
    @Published var price = 0
    @Published var additionalPrice = 0
}


struct MyTabBarView: View {
    @ObservedObject var textUpdater: TextUpdater
    @State var isPresented = false
    
    func formatNumber(_ value: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: value)) ?? ""
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("배달최소주문금액").foregroundColor(Color.gray).font(.system(size: 15))
                    Text("")
                }
                HStack {
                    Text("17,000원")
                    Text("")
                }
            }.padding()
            Button(action: {
                self.isPresented.toggle()
            }) {
                Text("\(formatNumber(textUpdater.price + textUpdater.additionalPrice))원 담기")
                    .frame(maxWidth: .infinity, maxHeight: 60)
                    .foregroundColor(Color.white)
                    .font(.headline).bold()
            }.background(RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color(UIColor(hex: 0x48D1CC))))
                .fullScreenCover(isPresented: $isPresented) {
                    NextView(price: textUpdater.price + textUpdater.additionalPrice)
                }
            .padding()
        }
    }
}


struct StoreView: View {
    
    let textUpdater = TextUpdater()
    
    @State private var isMediumSelected = false
    @State private var isLargeSelected = false
    @State private var isDoughSelected = false
    @State private var isToppingSelected = false
    
    var body: some View {
        
        List() {
            Image("pizza").resizable()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 9 / 16)
            VStack {
                HStack {
                    Image("hot").resizable().frame(width: 30, height: 30)
                    Text("[재주문1위] 바싹불고기피자").font(.title3).bold()
                    Spacer()
                }
                Text("바싹 익힌 불고기의 풍미를 입안 가득 느낄 수 있는 자가제빵선명희피자의 야심작").foregroundColor(Color.gray)
                HStack {
                    Text(" ")
                    Text("영양성분 및 알레르기 성분 표시 보기")
                        .font(.system(size: 10))
                        .padding(3)
                        .background(Color(.systemGray6))
                        .cornerRadius(5)
                    Spacer()
                }
            }.listRowSeparator(.hidden, edges: .top)
            VStack {
                HStack {
                    Text("가격").font(.title3).bold()
                    Spacer()
                    Text("필수")
                        .padding(.horizontal, 7)
                        .padding(.vertical, 3)
                        .foregroundColor(Color.blue).background(Color.blue.opacity(0.2)).cornerRadius(10)
                }
                Text("")
                Text("")
                HStack {
                    Button(action: {
                        if isLargeSelected {
                            textUpdater.price -= 5000
                            isLargeSelected = false
                            isMediumSelected = true
                        } else {
                            if isMediumSelected {
                                textUpdater.price -= 20000
                                isMediumSelected = false
                            }
                            else {
                                textUpdater.price += 20000
                                isMediumSelected = true
                            }
                        }
                    }) {
                        Image(systemName: isMediumSelected ? "circle.fill" : "circle")
                    }.buttonStyle(PlainButtonStyle())
                    Text("M")
                    Spacer()
                    Text("20,000원")
                }
                Text("")
                Text("")
                HStack {
                    Button(action: {
                        if isMediumSelected {
                            textUpdater.price += 5000
                            isMediumSelected = false
                            isLargeSelected = true
                        } else {
                            if isLargeSelected {
                                textUpdater.price -= 25000
                                isLargeSelected = false
                            }
                            else {
                                textUpdater.price += 25000
                                isLargeSelected = true
                            }
                        }
                    }) {
                        Image(systemName: isLargeSelected ? "circle.fill" : "circle")
                    }
                    Text("L")
                    Spacer()
                    Text("25,000원")
                }
                Text("")
            }
            VStack {
                HStack {
                    Text("도우변경").font(.title3).bold()
                    Spacer()
                    Text("선택")
                        .foregroundColor(Color(.darkGray))
                        .padding(.horizontal, 7)
                        .padding(.vertical, 3)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
                HStack {
                    Text("최대 1개 선택").foregroundColor(Color(.darkGray)).font(.system(size: 15))
                    Spacer()
                }
                Text("")
                Text("")
                HStack {
                    Button(action: {
                        if isDoughSelected {
                            isDoughSelected = false
                            textUpdater.additionalPrice -= 4500
                        }
                        else {
                            isDoughSelected = true
                            textUpdater.additionalPrice += 4500
                        }
                    }) {
                        Image(systemName: isDoughSelected ? "square.fill" : "square")
                    }.buttonStyle(PlainButtonStyle())
                    Text("크림리치골드 크러스트")
                    Spacer()
                    Text("+4,500원")
                }
                Text("")
            }
            VStack {
                HStack {
                    Text("토핑추가").font(.title3).bold()
                    Spacer()
                    Text("선택")
                        .foregroundColor(Color(.darkGray))
                        .padding(.horizontal, 7)
                        .padding(.vertical, 3)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
                HStack {
                    Text("최대 1개 선택").foregroundColor(Color(.darkGray)).font(.system(size: 15))
                    Spacer()
                }
                Text("")
                Text("")
                HStack {
                    Button(action: {
                        if isToppingSelected {
                            isToppingSelected = false
                            textUpdater.additionalPrice -= 700
                        }
                        else {
                            isToppingSelected = true
                            textUpdater.additionalPrice += 700
                        }
                    }) {
                        Image(systemName: isToppingSelected ? "square.fill" : "square")
                    }.buttonStyle(PlainButtonStyle())
                    Text("옥수수")
                    Spacer()
                    Text("+700원")
                }
                Text("")
            }
        }.listStyle(.plain)
            .edgesIgnoringSafeArea(.top)
            .listRowBackground(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.red, lineWidth: 2)
            )
        MyTabBarView(textUpdater: textUpdater)
    }
}

struct ContentView: View {
    
    init() {
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    var body: some View {
        NavigationView {
            VStack{
                StoreView()
                    .edgesIgnoringSafeArea(.top)
                    .navigationBarItems(
                        leading:
                            HStack {
                                Image(systemName: "arrow.left")
                                    .foregroundColor(.black)
                                    .padding(.leading, 5)
                            },
                        trailing:
                            HStack {
                                Image(systemName: "house.fill")
                                Image(systemName: "square.and.arrow.up.fill")
                                Image(systemName: "cart.fill")
                            }
                    ).accentColor(.black)
                
            }

        }
    }
}

struct NextView: View {
    @Environment(\.dismiss) private var dismiss
    
    let price: Int
    
    init(price: Int) {
        self.price = price
    }
    
    func formatNumber(_ value: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: value)) ?? ""
    }
    
    var body: some View {
        Text(formatNumber(price)).onTapGesture {
            dismiss()
        }
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


