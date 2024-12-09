//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by Gaurav Mourya on 08/12/24.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    @Binding var scannedCode: String
    
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(ScannerView: self)
    }
    final class Coordinator: NSObject, ScannerVCDelegate {
        private let scannerView: ScannerView
        
        init(ScannerView: ScannerView) {
            self.scannerView = ScannerView
        }
        func didFind(barcode: String) {
            scannerView.scannedCode = barcode
        }
        
        func didSurface(error: CameraError) {
            print(error.rawValue)
        }
    }
}

#Preview {
    ScannerView(scannedCode: .constant("123456789"))
}
