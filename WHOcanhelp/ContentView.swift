//
//  ContentView.swift
//  WHOcanhelp
//
//  Created by 07 Zhang on 2020/4/20.
//  Copyright © 2020 07 Zhang. All rights reserved.
//

import SwiftUI
struct company{
    let compname: String
    let comptext: String
    let image:String
}
struct ContentView: View {
    //var company=["Google","Amazon","Facebook","Twitter"]改為用struct
    var comp:[company]=[
        company(compname: "Google", comptext: "匯整全球資訊\n供大眾使用\n使人人受惠",
                image:"Google"),
        company(compname: "Amazon", comptext: "全球最大的\n網際網路線上零售商",image:"Amazon"),
        
        company(compname: "Facebook", comptext: "保持專注\n 持續發佈",image:"Facebook"),
        
        company(compname: "Youtube", comptext: "Broadcast\n Yourself",image:"Youtube"),
        company(compname: "???", comptext: "你也可以幫忙\n做好防疫",image:"You")
    ]
    
    //@State private var selected = 0 //改為使用id
    @State private var selected = 0
    
    @State private var moveDistance: CGFloat = +140
    @State private var opacity: Double = 0
    var body: some View {
        
        ZStack{
            Image("Whocanhelp")
                .resizable()
                .frame(width:450,height:920)
                .scaledToFill()
            VStack{
                Text("\n\n\n")
                Picker(selection:$selected,label:Text("選擇\n”大“平臺")){
                    /* Text(self.company[0]).tag(0)
                     Text(self.company[1]).tag(1)
                     Text(self.company[2]).tag(2)
                     Text(self.company[3]).tag(3)*/
                    
                    //改用For each
                    ForEach(0..<comp.count) { (index) in
                        Text(self.comp[index].compname)}
                    
                    //改為使用For each id
                    /* ForEach(comp, id: \.compname) { (role) in
                     Text(role.compname)
                     
                     }//Foreach*/
                    
                }//picker
                    /*Text("選擇\(company[selected])的版面宣傳")*/
                    //改為使用id
                    .frame(width:400,height:130)
                    
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(30)
                    .offset(x:0,y:0)
                
                Text("標語：\n\(comp[selected].comptext)")
                    .font(.custom("GillSans-UltraBold",size:22))
                    .foregroundColor(Color.black)
                    .frame(width:400,height:150)
                    .offset(x:-100,y:60)
                Text("選擇\(comp[selected].compname)的版面宣傳")
                    .foregroundColor(Color.black)
                    .frame(width:200)
                    .offset(x:-100,y:230)
                Button("Taiwan-Help~") {
                    self.moveDistance -= 30
                    self.opacity += 0.2
                    
                    if (self.moveDistance <= -100){
                        self.moveDistance = +140
                        self.opacity=0
                    }
                }.font(.title)
                    .offset(x:100,y:-30)
                Image("\(comp[selected].image)")
                    .resizable()
                    .frame(width:200,height:150)
                    .offset(x: moveDistance, y: 0)
                    .opacity(opacity)
                    .animation(.easeOut)
                
            }//Vstack
        }//Zstack
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
