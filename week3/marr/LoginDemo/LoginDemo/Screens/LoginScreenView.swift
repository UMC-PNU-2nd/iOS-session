//
//  LoginScreenView.swift
//  LoginDemo
//
//  Created by Lee Jun Young on 2022/03/30.
//

import SwiftUI

struct LoginScreenView: View {
    var body: some View {
        VStack {
            Spacer()
            
            ImageWithRatio(
                    image: Image("ic_catstagram_logo"),
                    ratio: 0.75)
                .padding()
            
            LoginAreaView()
            
            Spacer()
            Divider()
            
            NavigationLink(
                destination: SignupScreenView()
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)) {
                        Text("계정이 없으신가요? 가입하기")
                            .font(.subheadline)
                            .fontWeight(.light)
                            .padding()
                }
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            
        }
    }
}

struct LoginScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreenView()
    }
}


struct EmailEnterView: View {
    @State private var email: String = ""
    var body: some View {
        TextField("이메일", text: $email)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.1), radius: 30, x: 0, y: 16)
            .padding(.horizontal)
    }
}

struct PasswordEnterView: View {
    @State private var password: String = ""
    var body: some View {
        SecureField("비밀번호", text: $password)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.1), radius: 30, x: 0, y: 16)
            .padding(.all)
    }
}

struct WideButton: View {
    var text: String
    var foreground: Color
    var background: Color
    var body: some View {
        Text(text)
            .padding()
            .foregroundColor(foreground)
            .frame(maxWidth: .infinity)
            .background(background)
            .cornerRadius(10)
            .padding()
    }
}

struct ImageWithRatio: View {
    var image: Image
    var ratio: Double
    var body: some View {
        image
            .resizable()
            .scaledToFit()
            .frame(width: UIScreen.main.bounds.width * ratio)
            .aspectRatio(contentMode: .fit)
    }
}

struct ButtonWithImage: View {
    var image: Image
    var text: Text
    var body: some View {
        HStack {
            Spacer()
            image
                .resizable()
                .frame(width: 30, height: 30)
            text
                .foregroundColor(Color.white)
                .padding(.horizontal)
            Spacer()
        }.padding()
    }
}

struct HorizontalDividerWithText: View {
    var text: String
    var body: some View {
        HStack {
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color.gray)
            Text(text)
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color.gray)
        }.padding(.horizontal)
    }
}

struct LoginAreaView: View {
    var body: some View {
        VStack {
            EmailEnterView()
            PasswordEnterView()
            
            HStack {
                Spacer()
                
                Text("비밀번호를 잊으셨나요?")
                    .foregroundColor(Color.black.opacity(0.5))
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .padding(.horizontal)
            
            Button(action: {
                
            }) {
                WideButton(text: "로그인",
                            foreground: Color.white, background: Color("FacebookColor"))
            }
            
            HorizontalDividerWithText(text: "또는")
            
            Button(action: {
                
            }) {
                ButtonWithImage(
                    image: Image("ic_login_facebook"),
                    text: Text("Facebook으로 로그인")
                )
            }
            .frame(maxWidth: .infinity)
            .background(Color("FacebookColor"))
            .cornerRadius(10)
            .padding()
        }
    }
}
