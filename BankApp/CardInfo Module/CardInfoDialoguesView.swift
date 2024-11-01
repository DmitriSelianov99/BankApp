//
// CardInfoDialoguesView.swift
// BankApp


import SwiftUI

struct CardInfoDialoguesView: View {
    
    @State var activeBtn: Int = (CardInfoDialoguesButtons.allCases.first?.hashValue)!
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Dialogues")
                .foregroundStyle(.white)
                .font(.system(size: 21, weight: .semibold))
            
            HStack {
                ForEach(CardInfoDialoguesButtons.allCases, id: \.self) { btn in
                    Button(btn.name) {
                        activeBtn = btn.hashValue
                    }.tag(btn.hashValue)
                        .font(.system(size: 12, weight: .regular))
                        .padding(6)
                        .background(activeBtn == btn.hashValue ? .linearYellow100 : .roundGray)
                        .foregroundStyle(activeBtn == btn.hashValue ? .black : .white)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                }
                
                Spacer()
                
                Button(action: {}, label: {
                    Image(systemName: "slider.horizontal.3")
                        .foregroundStyle(.white)
                        .padding(6)
                        .background(.roundGray)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                })
            }
        }
        .padding(.top, 35)
        .padding(.horizontal, 16)
    }
}

#Preview {
    CardInfoDialoguesView()
}
