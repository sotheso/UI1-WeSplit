//
//  ContentView.swift
//  UI1-WeSplit
//
//  Created by Sothesom on 10/09/1403.
//

import SwiftUI

struct ContentView: View {
    @State private var mablaq = 0.0
    // تعداد دنگ‌ها
    @State private var tedadAdam = 2
    @State private var darsadAnam = 20
    // فوکوس کیبورد
    @FocusState private var keybordfocus: Bool
    
    let darsadAnams = [5, 10, 20, 30, 35]
    
    // مجموع صورت حساب
    var mablaqPardalhti :Double {
        let darsadeAnam = Double(darsadAnam)
        
        let meqdarAnam = mablaq / 100 * darsadeAnam
        let mablaqPardakhti = meqdarAnam + mablaq
        
        return mablaqPardakhti
    }
    
    // محاسبه انعام
    var dongeHarNafar :Double {
        let donge = Double(tedadAdam + 2)
        let darsadeAnam = Double(darsadAnam)
        
        let meqdarAnam = mablaq / 100 * darsadeAnam
        let mablaqPardakhti = meqdarAnam + mablaq
        
        let dongeHarNafar = mablaqPardakhti / donge
        
        return dongeHarNafar
    }

    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("مبلغ", value: $mablaq, format: .currency(code: Locale.current.currency?.identifier ?? "USA"))
                        .keyboardType(.decimalPad)
                        .focused($keybordfocus)
                    
                    Picker("تعداد آدم‌ها", selection: $tedadAdam){
                        ForEach(2..<10){
                            Text("آدم \($0)")
                        }
                    }
//                    .pickerStyle(.navigationLink)
                }
                
                Section("لطفا درصد انعامی که میخواهید بدهید را مشخص کنید."){
                    Picker("درصد انعام", selection: $darsadAnam){
                        ForEach(darsadAnams, id: \.self){
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("مجموع صورت حساب"){
                    Text(mablaqPardalhti, format: .currency(code: Locale.current.currency?.identifier ?? "USA"))
                    
                }
                
                // نتیجه‌نهایی
                Section("دنگ هر نفر"){
                    Text(dongeHarNafar, format: .currency(code: Locale.current.currency?.identifier ?? "USA"))
                }
            }
            .navigationTitle("صورت حساب انعام")
            // دکمه برای در کردن فوکوس کیبورد
            .toolbar{
                if keybordfocus {
                    Button("انجام شد"){
                        keybordfocus = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
