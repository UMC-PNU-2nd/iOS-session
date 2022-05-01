//
//  LoginView.swift
//  umc
//
//  Created by Yujin Cha on 2022/03/30.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isShowingHomeView: Bool = false
    @State private var isShowingRegisterView: Bool = false
    @State private var userInfo: UserInfo = UserInfo(email: "", name: "", nickname: "", password: "")
    
    @State private var isValidEmail = false {
        didSet { self.validateLogin() }
    }
    @State private var isValidPassword = false {
        didSet { self.validateLogin() }
    }
    @State private var btnColor: Color = Color("colors/disabledBtnColor")
    @State private var btnDisAbled: Bool = true
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(alignment: .center) {
                    Image("ic_catstagram_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 50)
                        .padding(.bottom, 50)
                    TextField("이메일", text: $email)
                        .onChange(of: email) {
                            isValidEmail = $0.isValidEmail()
                        }
                        .textFieldStyle(.roundedBorder)
                    TextField("비밀번호", text: $password)
                        .onChange(of: password) {
                            isValidPassword = $0.count >= 8
                        }
                        .textFieldStyle(.roundedBorder)
                    HStack {
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("비밀번호를 잊으셨나요?")
                                .font(.system(size: 12))
                        }
                    }.padding(.bottom, 45)
                    Button {
                        if userInfo.email == self.email && userInfo.password == self.password {
                            goHomeView()
                        }
                    } label: {
                        Text("로그인")
                            .foregroundColor(Color.white)
                            .bold()
                            .frame(maxWidth: .infinity, maxHeight: 54)
                            .background(btnColor)
                            .cornerRadius(10)
                    }
                        .disabled(btnDisAbled)
                    HStack {
                        Rectangle()
                            .fill(Color(hex: 0xd4d4d4))
                            .frame(maxWidth: .infinity, minHeight: 1, idealHeight: 1, maxHeight: 1)
                        Text("또는")
                            .font(.system(size: 12))
                            .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                        Rectangle()
                            .fill(Color(hex: 0xd4d4d4))
                            .frame(maxWidth: .infinity, minHeight: 1, idealHeight: 1, maxHeight: 1)
                    }.padding(.top, 30)
                    Button {
                        
                    } label: {
                        HStack {
                            Image("로그인/ic_login_facebook")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 20)
                            Text("Facebook으로 로그인")
                        }
                            .frame(maxWidth: .infinity, maxHeight: 54)
                    }
                        .padding(.top, 18)
                }
                VStack(alignment: .center) {
                    Spacer()
                    Rectangle()
                        .fill(Color(hex: 0xd4d4d4))
                        .frame(maxWidth: .infinity, minHeight: 1, idealHeight: 1, maxHeight: 1)
                        .padding(.bottom, 15)
                    VStack {
                        NavigationLink(destination: RegisterView( userInfo: $userInfo), isActive: $isShowingRegisterView) { EmptyView() }
                        Button {
                            isShowingRegisterView = true
                        } label: {
                            Text("계정이 없으신가요? 가입하기")
                                .font(.system(size: 12))
                        }.padding(.bottom, 25)
                    }
                }
            }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        }
    }
    
    
    func goHomeView() {
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = UIHostingController(rootView: HomeView())
            window.makeKeyAndVisible()
        }
    }
    
    private func validateLogin() {
        if isValidEmail && isValidPassword {
            btnColor = Color("colors/actibatedBtnColor")
            btnDisAbled = false
        }
        else {
            btnColor = Color("colors/disabledBtnColor")
            btnDisAbled = true
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
