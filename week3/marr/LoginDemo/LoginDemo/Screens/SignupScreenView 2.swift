//
//  SignupScreenViews.swift
//  LoginDemo
//
//  Created by Lee Jun Young on 2022/03/30.
//

import SwiftUI

struct SignupScreenView: View {
    var body: some View {
        NavigationView {
            VStack {
                ImageWithRatio(
                    image: Image("ic_catstagram_logo"),
                    ratio: 0.65)
                    .padding()
                
                Text("친구들의 사진과 동영상을 보려면\n가입하세요")
                    .multilineTextAlignment(.center)
                
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
                
                HorizontalDividerWithText(text: "또는")
                    .padding()
                
                SignupInputAreaView()
                Spacer()
                Divider()
                NavigationLink(
                    destination: LoginScreenView()
                        .navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)) {
                            Text("계정이 있으신가요? 로그인")
                                .padding()
                    }
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                
            }
        }
    }
}
struct SignupInputAreaView: View {
    @ObservedObject var user = Signup()
    var body: some View {
        VStack {
            TextField("휴대폰 번호 또는 이메일 주소", text: $user.email)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.1), radius: 30, x: 0, y: 16)
                .padding(.horizontal)
            
            TextField("성명", text: $user.username)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.1), radius: 30, x: 0, y: 16)
                .padding(.horizontal)
            
            TextField("사용자 이름", text: $user.userId)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.1), radius: 30, x: 0, y: 16)
                .padding(.horizontal)
            
            SecureField("비밀번호", text: $user.password)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.1), radius: 30, x: 0, y: 16)
                .padding(.horizontal)
            
            Button(action: {
                
            }) {
                WideButton(
                text: "가입",
                foreground: Color.white,
                background: user.isValid() ? Color("FacebookColor") : Color("FacebookColor").opacity(0.5))
            }
            .disabled(!user.isValid())
        }
    }
}


struct SignupScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SignupScreenView()
    }
}
