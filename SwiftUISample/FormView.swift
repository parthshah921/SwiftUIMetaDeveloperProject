//
//  FormView.swift
//  SwiftUISample
//
//  Created by Parth Shah on 2024-07-13.
//

import SwiftUI

struct FormView: View {
    
    var selectedRestaurant : Restaurant
    @State var partyCount = 1
    @State var name = ""
    @State var phone = ""
    @State var email = ""
    @State private var specialRequest: String = ""
    @State var selectedDate = Date()
    @State private var showAlert = false
    @State private var alertMessage = ""
    @Environment(\.presentationMode) var presentationMode
    
    var dateRange : ClosedRange<Date>{
        let min = Calendar.current.date(byAdding: .month, value: -10, to: Date())!
        let max = Calendar.current.date(byAdding: .hour, value: 1, to: Date())!
        return min...max
    }
    

    var body: some View {
       
            VStack(){
                HStack{
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Little Lemon")
                }.padding(.top,16)
                
                Text("Reservation Details")
                    .padding(.vertical,12)
                    .padding(.horizontal,50)
                    .background(Color.cyan)
                    .foregroundColor(.white)
                    .cornerRadius(16)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 0)
                 
                Form{
                    VStack(alignment: .leading){
                        Text(selectedRestaurant.name)
                            .font(.headline)
                            .fontWeight(Font.Weight.medium)
                            .multilineTextAlignment(.leading)
                        
                        Text(selectedRestaurant.description)
                            .font(.subheadline)
                            .fontWeight(Font.Weight.ultraLight)
                            .padding(0)
                        
                        Rectangle()
                            .frame(height: 0.1)
                            .background(Color.gray)
                            .padding(.vertical,8)
                        
                        Text("Party Count : \(partyCount)")
                        Stepper("Number Of Guests",value : $partyCount,in: 1...10)
                        
                        
                        HStack(alignment: .lastTextBaseline) {
                            DatePicker(
                                "",
                                selection: $selectedDate,
                                in: dateRange,
                                displayedComponents: .date
                            )
                            DatePicker(
                                "",
                                selection: $selectedDate,
                                in: dateRange,
                                displayedComponents: .hourAndMinute
                            )
                            
                        }.padding(.vertical,4)
                        
                        Rectangle()
                            .frame(height: 0.4)
                            .background(Color.gray)
                            .padding(.vertical,16)
                        
                        Section(header: Text("User Information")) {
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("NAME: ")
                                        .foregroundColor(.gray)
                                    TextField("Enter your name", text: $name).frame(height: 50)
                                }
                                
                                Rectangle()
                                    .frame(height: 0.5)
                                    .foregroundColor(.gray)
                                    .padding(.vertical, 8)
                                
                                HStack {
                                    Text("PHONE: ")
                                        .foregroundColor(.gray)
                                    TextField("Phone Number", text: $phone)
                                        .keyboardType(.numberPad)
                                        .frame(height: 50)
                                }
                                
                                Rectangle()
                                    .frame(height: 0.5)
                                    .foregroundColor(.gray)
                                    .padding(.vertical, 8)
                                
                                
                                HStack {
                                    Text("E-MAIL: ")
                                        .foregroundColor(.gray)
                                    TextField("Enter your email", text: $email).frame(height: 50)
                                }
                                
                                Rectangle()
                                    .frame(height: 0.5)
                                    .foregroundColor(.gray)
                                    .padding(.vertical, 8)
                                
                                
                                TextField("Add any special request (optional)", text: $specialRequest,axis : .vertical)
                                    .multilineTextAlignment(.leading)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .fixedSize(horizontal: false, vertical: false)
                                    .lineLimit(4...10)
                                
                                Rectangle()
                                    .frame(height: 0.5)
                                    .foregroundColor(.gray)
                                    .padding(.vertical, 8)
                                
                                Button(role : .none){
                                   checkValidation()
                                }label : {
                                    Text("Confirm Reservation")
                                        .padding(20)
                                        .background(.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(14)
                                        
                                       
                                }
                                
                                Spacer()
                            }
                            .padding(.vertical)
                        }.padding(0)
                        
                        
                        
                    }
                }.scrollContentBackground(.hidden)
            } .alert(isPresented: $showAlert) {
                Alert(title: Text("Validation Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
    }
    
    func checkValidation()
    {
        var isValid = true
        var validationMsg = ""
        
        if name.isEmpty
        {
            isValid = false
            validationMsg += "Name is required \n"
        }
        
        if  phone.isEmpty || phone.count != 10
        {
            isValid = false
            validationMsg += "Phone is required and it should contain 10 digits \n"
        }
        
        if email.isEmpty
        {
            isValid = false
            validationMsg += "Email is required"
        }
        
      
        if(isValid)
        {
            showAlert = true
            alertMessage = "Reservation confirmed!"
            presentationMode.wrappedValue.dismiss()
        }
        else{
            showAlert = true
            alertMessage = validationMsg
        }
        
    }
}

#Preview {
    FormView(selectedRestaurant: restaurantList[0])
}
