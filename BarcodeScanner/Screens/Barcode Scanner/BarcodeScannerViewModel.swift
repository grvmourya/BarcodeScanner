//
//  BarcodeScannerViewModel.swift
//  BarcodeScanner
//
//  Created by Gaurav Mourya on 12/12/24.
//

import SwiftUI

final class BarcodeScannerViewModel: ObservableObject {
    @Published var scannedCode = ""
    @Published var alertItem: AlertItem?
    
    var statusText: String {
        return scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode
    }
    
    var statusTextColor: Color {
        return scannedCode.isEmpty ? .red : .green
    }
}