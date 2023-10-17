//
//  PhotoPickerView.swift
//  Forelesning_3_23
//
//  Created by Håkon Bogen on 10/10/2023.
//

import SwiftUI

//PhotoPickerView.Coordinator

struct PhotoPickerView: UIViewControllerRepresentable {
    
    let sourceType: UIImagePickerController.SourceType
    var didPickImage: ((UIImage) -> Void)?
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        
        var didPickImage: ((UIImage) -> Void)?
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            print(info)
            if let image = info[.originalImage] as? UIImage {
                didPickImage?(image)
            }
        }
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        let viewController = UIImagePickerController()
        viewController.sourceType = sourceType
        viewController.delegate = context.coordinator
        
        context.coordinator.didPickImage = { image in
            didPickImage?(image)
        }
        
        return viewController
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
}

struct PhotoPickerView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoPickerView(sourceType: .photoLibrary)
    }
}
