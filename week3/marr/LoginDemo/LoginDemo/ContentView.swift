//
//  ContentView.swift
//  LoginDemo
//
//  Created by Lee Jun Young on 2022/03/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            
            ImageWithRatio(ratio: 0.75)
                .padding()
            
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
                    LoginButton(text: "로그인",
                                foreground: Color.white, background: Color("PrimaryColor"))
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
                .background(Color.blue.opacity(0.5))
                .cornerRadius(20)
                .padding()
            }
            
            Spacer()
            Divider()
            
            Text("계정이 없으신가요? 가입하기")
                .font(.subheadline)
                .fontWeight(.light)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}

struct EmailEnterView: View {
    @State private var email: String = ""
    var body: some View {
        TextField("이메일", text: $email)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(20)
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
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.1), radius: 30, x: 0, y: 16)
            .padding(.all)
    }
}

struct LoginButton: View {
    var text: String
    var foreground: Color
    var background: Color
    var body: some View {
        Text(text)
            .padding()
            .foregroundColor(foreground)
            .frame(maxWidth: .infinity)
            .background(background)
            .cornerRadius(20)
            .padding()
    }
}

struct ImageWithRatio: View {
    var ratio: Double
    var body: some View {
        Image("ic_catstagram_logo")
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
