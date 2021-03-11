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
    @State var result = "手を選んでください"
    
    func jankenResult() {
        self.enemyNum = Int.random(in: 1..<4)
        if (jankenNum == 1 && enemyNum == 2) || (jankenNum == 2 && enemyNum == 3) || (jankenNum == 3 && enemyNum == 1) {
            result = "かち！"
        }else if jankenNum == enemyNum {
            result = "あいこ"
        }else{
            result = "まけ..."
        }
    }
    
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
            Text(result)
                .font(.title)
                .fontWeight(.bold)
            Spacer()
            JankenImg(num: $jankenNum)
            HStack{
                JankenButton(jankenNum: $jankenNum, enemyNum: $enemyNum, result: $result, jankenID: 1, color: Color.red)
                JankenButton(jankenNum: $jankenNum, enemyNum: $enemyNum, result: $result, jankenID: 2, color: Color.yellow)
                JankenButton(jankenNum: $jankenNum, enemyNum: $enemyNum, result: $result, jankenID: 3, color: Color.blue)
            }
            Button(action: {
                jankenResult()
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
            .frame(width: 120, height: 120)
    }
}

struct JankenButton: View {

    @Binding var jankenNum: Int
    @Binding var enemyNum: Int
    @Binding var result: String
    let jankenID: Int
    let color: Color

    var body: some View {
        Button(action: {
            jankenNum = jankenID
            enemyNum = 0
            result = ""
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
