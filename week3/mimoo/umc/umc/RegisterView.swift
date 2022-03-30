//
//  RegisterView.swift
//  umc
//
//  Created by Yujin Cha on 2022/03/30.
//

import SwiftUI

struct RegisterView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var userInfo: UserInfo
    
    @State private var email: String = ""
    @State private var name: String = ""
    @State private var nickname: String = ""
    @State private var password: String = ""
        
    @State private var isValidEmail = false {
        didSet { self.validateUserInfo() }
    }
    @State private var isValidName = false {
        didSet { self.validateUserInfo() }
    }
    @State private var isValidNickname = false {
        didSet { self.validateUserInfo() }
    }
    @State private var isValidPassword = false {
        didSet { self.validateUserInfo() }
    }
    @State private var btnColor: Color = Color("colors/disabledBtnColor")
    @State private var btnDisAbled: Bool = true
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Button{
                           self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("back")
                        .foregroundColor(Color.gray)
                }
                    .navigationBarHidden(true)
                Spacer()
            }
            VStack {
                Image("ic_catstagram_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 50)
                    .padding(.bottom, 20)
                Text("친구들의 사진과 동영상을 보려면\n가입하세요")
                    .font(.system(size: 16))
                    .multilineTextAlignment(.center)
                Button {
                    
                } label: {
                    HStack {
                        Image("로그인/ic_login_facebook")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 20)
                        Text("Facebook으로 로그인")
                            .foregroundColor(Color.white)
                    }
                        .frame(maxWidth: .infinity, maxHeight: 54)
                        .background(Color("colors/actibatedBtnColor"))
                        .cornerRadius(10)
                }
                    .padding(.top, 35)
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
                makeInputFields()
                Button {
                    userInfo = UserInfo(
                        email: self.email,
                        name: self.name,
                        nickname: self.nickname,
                        password: self.password)
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("가입")
                        .foregroundColor(Color.white)
                        .bold()
                        .frame(maxWidth: .infinity, maxHeight: 54)
                        .background(btnColor)
                        .cornerRadius(10)
                }
                    .disabled(btnDisAbled)
                    .background(btnColor)
            }
            Spacer()
            Rectangle()
                .fill(Color(hex: 0xd4d4d4))
                .frame(maxWidth: .infinity, minHeight: 1, idealHeight: 1, maxHeight: 1)
                .padding(.bottom, 15)
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("계정이 있으신가요? 로그인하기")
                    .font(.system(size: 12))
            }.padding(.bottom, 25)
        }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        
    }
    
    func makeInputFields() -> some View {
        VStack {
            TextField("휴대폰 번호 또는 이메일 주소", text: $email)
                .onChange(of: email) {
                    self.isValidEmail = $0.isValidEmail()
                }
                .textFieldStyle(.roundedBorder)
            TextField("성명", text: $name)
                .onChange(of: name) {
                    self.isValidName = $0.count > 2
                }
                .textFieldStyle(.roundedBorder)
            TextField("사용자 이름", text: $nickname)
                .onChange(of: nickname) {
                    self.isValidNickname = $0.count > 2
                }
                .textFieldStyle(.roundedBorder)
            TextField("비밀번호", text: $password)
                .onChange(of: password) {
                    self.isValidPassword = $0.isValidPassword()
                }
                .textFieldStyle(.roundedBorder)
        }
    }
    
    private func validateUserInfo() {
        if isValidEmail && isValidName && isValidNickname && isValidPassword {
            btnColor = Color("colors/actibatedBtnColor")
            btnDisAbled = false
        }
        else {
            btnColor = Color("colors/disabledBtnColor")
            btnDisAbled = true
        }
    }
    
}

//struct RegisterView_Previews: PreviewProvider {
//    static var previews: some View {
//        RegisterView(userInfo: )
//    }
//}
