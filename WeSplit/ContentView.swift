//
//  ContentView.swift
//  WeSplit
//
//  Created by Valentin State on 11/08/2021.
//

import SwiftUI

struct ContentView: View {
	@State private var checkAmount = ""
	@State private var numberOfPeople: Int = 0
	@State private var tipPercentage: Int = 2
	
	let tipPercentages = [10, 15, 20, 25, 0]
		
	var totalPerPerson: Double {
		let peopleCount = Double(numberOfPeople + 2)
		let tipSelection = Double(tipPercentages[tipPercentage])
		let orderAmount = Double(checkAmount) ?? 0
		let tipValue = orderAmount / 100 * tipSelection
		let grandTotal = orderAmount + tipValue
		let amountPerPerson = grandTotal / peopleCount
		
		return Double(amountPerPerson)
	}
		
	
	var body: some View {
		NavigationView {
			Form {
				Section(header: Text("Specifications")) {
					TextField("Order Amount", text: $checkAmount)
						.keyboardType(.decimalPad)
					
					Picker("People", selection: $numberOfPeople) {
						ForEach(2..<100) { number in
							Text("\(number)")
						}
					}
					
				}
				Section(header: Text("Select tip percentage")) {
					Picker("Percentage", selection: $tipPercentage) {
						ForEach(0 ..< tipPercentages.count) {
							Text("\(tipPercentages[$0])%")
						}
					}.pickerStyle(SegmentedPickerStyle())
					
				}
							
				if(checkAmount.count > 0) {
					Section(header: Text("Results")) {
						Text("£\(totalPerPerson, specifier: "%.1f") each")
					}
				}
			}
			.navigationBarTitle("WeSplit", displayMode: .inline)
		}
		
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
