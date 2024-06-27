//
//  AddTaskView.swift
//  MakeIt
//
//  Created by Allan Soberanski on 27/06/24.
//

import SwiftUI

struct AddTaskView: View {
    @State private var text: String = ""
    @State private var date: Date = Date()
    
    
    
    var body: some View {
        VStack {
            titledTextField(title: "Título", text: $text)
            titledTextField(title: "Descrição", text: $text, axis: .vertical)
            DatePicker("Data de inicio", selection: $date, displayedComponents: .date)
                .font(.system(.callout, weight: .bold))
            DatePicker("Horário de inicio", selection: $date, displayedComponents: .hourAndMinute)
                .font(.system(.callout, weight: .bold))
            Spacer()
            Button {
                print(date)
            } label: {
                HStack(content: {
                    Text("Adicionar tarefa")
                        .foregroundStyle(.white)
                })
                .frame(width: 180, height: 50)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }

        }
        .padding(20)
        .toolbarTitleDisplayMode(.large)
        .navigationTitle("Adicionar tarefa")
    }
    
    private func titledTextField(
        title: String,
        placeholder: String = "",
        text: Binding<String>,
        axis: Axis = .horizontal
    ) -> some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(.title3, weight: .bold))
            TextField(placeholder, text: $text, axis: axis)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                        .frame(maxHeight: axis == .horizontal ? 44 : .infinity)
                )
                .keyboardType(.numberPad)
                .frame(maxWidth: .infinity)
        }
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
    }
}
