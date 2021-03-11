//
//  ContentView.swift
//  RandomNumber
//
//  Created by 澤崎正佳 on 2021/03/11.
//

import SwiftUI

let janken = ["なし", "グー", "チョキ", "パー"]

struct ContentView: View {
    @State var jankenNum = 0
    @State var enemyNum = 0
    
    var body: some View {
        VStack{
            HStack{
                Image("Enemy")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                Text("このわたしに\n勝てるかな？")
                    .font(.title)
                    .fontWeight(.bold)
            }
            JankenImg(num: $enemyNum)
                .scaleEffect(x: -1, y: -1)
            Spacer()
            JankenImg(num: $jankenNum)
            HStack{
                JankenButton(num: $jankenNum, jankenID: 1, color: Color.red)
                JankenButton(num: $jankenNum, jankenID: 2, color: Color.yellow)
                JankenButton(num: $jankenNum, jankenID: 3, color: Color.blue)
            }
            Button(action: {
                enemyNum = Int.random(in: 1..<4)
            }, label: {
                Text("しょうぶ！")
                    .foregroundColor(.white)
                    .font(.title)
                    .frame(width: 300, height: 75)
                    .background(jankenNum == 0 ? Color.gray:Color.green)
                    .cornerRadius(10)
            })
            .disabled(jankenNum == 0)
            .padding()
        }
    }
}

struct JankenImg: View {
    @Binding var num: Int
    var body: some View {
        Image(janken[num])
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 120)
    }
}

struct JankenButton: View {
    @Binding var num: Int
    let jankenID: Int
    let color: Color
    var body: some View {
        Button(action: {
            num = jankenID
        }, label: {
            Text(janken[jankenID])
                .foregroundColor(.white)
                .font(.title)
                .frame(width: 100, height: 100)
                .background(color)
                .cornerRadius(10)
                
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
