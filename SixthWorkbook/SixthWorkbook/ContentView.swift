import SwiftUI

struct ContentView: View {
    let coloredNavAppearance = UINavigationBarAppearance()
    @State var tag:Int? = nil

    init() {
        coloredNavAppearance.configureWithOpaqueBackground()
        coloredNavAppearance.backgroundColor = UIColor.systemMint
        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
    }
    
    var body: some View {
        let buttons = ["Button 1", "Button 2", "Button 3", "Button 4", "Button 5", "Button 6"]
        NavigationView {
            VStack {
                // ScrollView 추가
                ScrollView {
                    // Scroll View에 표시될 내용 추가
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color(.systemGray6))
                        TextField("Search", text: .constant("df"))
                            .padding(8)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                        Spacer()
                        
                    }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.mint)
                    NavigationLink(destination: secondNextView(), tag: 1, selection: self.$tag ) {
                        
                    }
                    Button(action: {
                        self.tag = 1
                        print("Button Clicked!")
                    }) {
                        Text("누구나 받으세요!\n최대 12,000원 할인")
                            .foregroundColor(.black)
                            .padding()
                            .frame(maxWidth: .infinity)
                    }
                        
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .padding()
                        .cornerRadius(8)
                    LazyVGrid(columns: Array(repeating: GridItem(), count: 2), spacing: 16) {
                                       ForEach(buttons, id: \.self) { buttonTitle in
                                           Button(action: {
                                               // 각 버튼이 클릭되었을 때의 동작 정의
                                               print("\(buttonTitle) Clicked!")
                                           }) {
                                               Text(buttonTitle)
                                                   .foregroundColor(.white)
                                                   .padding()
                                                   .frame(maxWidth: .infinity)
                                                   .background(Color.blue)
                                                   .cornerRadius(10)
                                           }
                                       }
                                   }
                                   .padding()
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(buttons, id: \.self) { buttonTitle in
                                Button(action: {
                                    // 각 버튼이 클릭되었을 때의 동작 정의
                                    print("\(buttonTitle) Clicked!")
                                }) {
                                    Text(buttonTitle)
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(Color.blue)
                                        .cornerRadius(10)
                                }
                            }
                        }
                        .padding()
                    }
                    
                    Text("Item 0")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                    Text("Item 0")
                        .padding()
                        .frame(maxWidth: .infinity)
                    Text("Item 0")
                        .padding()
                        .frame(maxWidth: .infinity)
                    Text("Item 0")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 400)
                }
                    .frame(maxWidth: .infinity)
                    .background(Color(.systemGray5))
                // 하단에 버튼 추가
                HStack {
                    TabButtonView(image: "magnifyingglass", title: "검색")
                        .frame(maxWidth: .infinity)
                    TabButtonView(image: "heart", title: "찜")
                        .frame(maxWidth: .infinity)
                    TabButtonView(image: "heart", title: "찜")
                        .frame(maxWidth: .infinity)
                    TabButtonView(image: "heart", title: "찜")
                        .frame(maxWidth: .infinity)
                    NavigationLink(destination: WeatherAPIView(), tag: 3, selection: self.$tag ) {
                    }
                    Button(action: {self.tag = 3}){
                        VStack{
                            Image(systemName: "book")
                            Text("날씨API")
                        }
                    }.frame(maxWidth: .infinity)
                    NavigationLink(destination: LogInView(), tag: 2, selection: self.$tag ) {
                    }
                    Button(action: {self.tag = 2}){
                        VStack{
                            Image(systemName: "person")
                            Text("로그인")
                        }
                    }.frame(maxWidth: .infinity)
                   
                }
                    .frame(maxWidth: .infinity)
                    .frame(height: 20)
                    .padding()
                
            }
                .navigationBarItems(
                   leading:
                       Text("동작구 여의대방로 44길 46")
                           .foregroundColor(.white)
                           .font(.headline),
                   trailing:
                       HStack {
                           Button(action: { print("click button") }) {
                               Image(systemName: "line.horizontal.3")
                                   .imageScale(.large)
                                   .foregroundColor(.white)
                                   .padding()
                           }
                           Button(action: { print("click button") }) {
                               Image(systemName: "alarm")
                                   .imageScale(.large)
                                   .foregroundColor(.white)
                                   .padding()
                           }
                       }
                )
            }
        }
}

struct contentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


