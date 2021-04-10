//
//  ContentView.swift
//  Convertitore
//
//  Created by Manuel Macaj on 08/04/21.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Proprieties
    @State private var inputValue = ""
    @State private var converterLenght = ["meters", "kilometers", "feet", "yards", "miles"]
    private var unitLength = ["m", "km", "ft", "yd", "mi"]
    @State private var positionInputPicker = 0
    @State private var positionOutputPicker = 1
    
    
    // MARK: - Result convertion
    
    private var resultMeasurament: Measurement<UnitLength> {
        let inputValueText = Double(inputValue) ?? 0
        var result: Measurement<UnitLength> = Measurement.init(value: 0, unit: .init(symbol: "Cannot convert the same unit length"))
        
        if(converterLenght[positionInputPicker].elementsEqual(converterLenght[positionOutputPicker])) {
            print("Do nothing")
        }
        else{
            if (converterLenght[positionInputPicker] == "meters") {
                let meters = Measurement(value: inputValueText, unit: UnitLength.meters)
                if(converterLenght[positionOutputPicker] == "kilometers"){
                    result = meters.converted(to: .kilometers)
                } else if (converterLenght[positionOutputPicker] == "feet"){
                    result = meters.converted(to: .feet)
                } else if (converterLenght[positionOutputPicker] == "yards") {
                    result = meters.converted(to: .yards)
                } else if(converterLenght[positionOutputPicker] == "miles") {
                    result = meters.converted(to: .miles)
                }
            } else if (converterLenght[positionInputPicker] == "kilometers") {
                let kilometers = Measurement(value: inputValueText, unit: UnitLength.kilometers)
                if (converterLenght[positionOutputPicker] == "meters") {
                    result = kilometers.converted(to: .meters)
                } else if (converterLenght[positionOutputPicker] == "feet"){
                    result = kilometers.converted(to: .feet)
                } else if (converterLenght[positionOutputPicker] == "yards") {
                    result = kilometers.converted(to: .yards)
                } else if(converterLenght[positionOutputPicker] == "miles") {
                    result = kilometers.converted(to: .miles)
                }
            } else if(converterLenght[positionInputPicker] == "feet") {
                let feet = Measurement(value: inputValueText, unit: UnitLength.feet)
                if (converterLenght[positionOutputPicker] == "meters") {
                    result = feet.converted(to: .meters)
                } else if (converterLenght[positionOutputPicker] == "kilometers"){
                    result = feet.converted(to: .kilometers)
                } else if (converterLenght[positionOutputPicker] == "yards") {
                    result = feet.converted(to: .yards)
                } else if(converterLenght[positionOutputPicker] == "miles") {
                    result = feet.converted(to: .miles)
                }
            } else if(converterLenght[positionInputPicker] == "yards") {
                let yard = Measurement(value: inputValueText, unit: UnitLength.yards)
                if (converterLenght[positionOutputPicker] == "meters") {
                    result = yard.converted(to: .meters)
                } else if (converterLenght[positionOutputPicker] == "kilometers"){
                    result = yard.converted(to: .kilometers)
                } else if (converterLenght[positionOutputPicker] == "feet") {
                    result = yard.converted(to: .feet)
                } else if(converterLenght[positionOutputPicker] == "miles") {
                    result.convert(to: .miles)
                }
            } else if(converterLenght[positionInputPicker] == "miles") {
                let miles = Measurement(value: inputValueText, unit: UnitLength.miles)
                if (converterLenght[positionOutputPicker] == "meters") {
                    result = miles.converted(to: .meters)
                } else if (converterLenght[positionOutputPicker] == "kilometers"){
                    result = miles.converted(to: .kilometers)
                } else if (converterLenght[positionOutputPicker] == "feet") {
                    result = miles.converted(to: .feet)
                } else if(converterLenght[positionOutputPicker] == "yards") {
                    result.convert(to: .yards)
                }
            }
        }
        return result
    }
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            Form {
                Section (header: Text("Input type")) {
                    Picker ("Select unit of length", selection: $positionInputPicker) {
                        ForEach(0 ..< converterLenght.count) {
                            Text("\(converterLenght[$0])")
                        }
                    }
                    
                    HStack {
                        TextField("Insert value", text: $inputValue)
                            .keyboardType(.decimalPad)
                        Text("\(unitLength[positionInputPicker])")
                    }
                }
                
                Section (header: Text("Output type")) {
                    Picker ("Select unit of length", selection: $positionOutputPicker) {
                        ForEach(0 ..< converterLenght.count) {
                            Text("\(converterLenght[$0])")
                        }
                    }
                    Text("\(resultMeasurament.value, specifier: "%.2f") \(resultMeasurament.unit.symbol)")
                }
            }
            .navigationBarTitle("Length converter", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
