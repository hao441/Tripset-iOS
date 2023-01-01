//
//  SearchModel.swift
//  SearchMine
//
//  Created by Hao on 13/12/2022.
//

import SwiftUI
import Foundation
import MapKit

struct SearchThis : View {
    @Environment(\.dismiss) var dismiss
    
    @StateObject var searchModel = SearchModel()
    @FocusState private var searchIsFocused:Bool
    
    @Binding var searchResult:String
    
    var body: some View {
        NavigationStack {
            ZStack {
                Form {
                    Section {
                        TextField("Type Here", text: $searchModel.searchText)
                            .multilineTextAlignment(.center)
                            .onChange(of: searchModel.searchText) { newValue in
                                searchModel.completer.queryFragment = searchModel.searchText
                            }.focused($searchIsFocused)
                    }
                    Section {
                        List(searchModel.locationResult, id: \.self) { results in
                            Button(results.title) {
                                print(results.self.title)
                                searchResult = results.self.title
                                dismiss()
                            }
                            .foregroundColor(.black)
                        }
                    }
                }
                Button("dismiss") {
                    dismiss()
                }
                .position(x: 350, y:0)
            }
        }.onAppear {
            DispatchQueue.main.async {
                self.searchIsFocused = true
            }
        }
    }
}

struct SearchThis_Previews: PreviewProvider {
    static var previews: some View {
        SearchThis(searchResult: .constant(""))
    }
}



class SearchModel: NSObject, ObservableObject, MKLocalSearchCompleterDelegate {
    @Published var searchText = ""
    @Published var locationResult: [MKLocalSearchCompletion] = []
    @Published var chosenLocation:String = ""
    
    
    let completer = MKLocalSearchCompleter()
    
    override init() {
        super.init()
        completer.delegate = self
        
        completer.resultTypes = MKLocalSearchCompleter.ResultType([.address])
    }

    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.locationResult = completer.results.filter { result in
            if !result.title.contains(",") {
                return false
            }

            if result.title.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil {
                return false
            }

            if result.subtitle.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil {
                return false
            }

            return true
        }
    }

    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
