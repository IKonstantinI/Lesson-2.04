//
//  ViewController.swift
//  Lesson 2.04
//
//  Created by Konstantin on 21.03.2025.
//

import UIKit

final class ViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var textField: UITextField!
        
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        setupSlider()
        setupMainLabel()

    }
   
    // MARK: - IB Actions
    @IBAction func segmentedControlAction() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mainLabel.text = "First segment"
            mainLabel.textColor = .green
        case 1:
            mainLabel.text = "Second segment"
            mainLabel.textColor = .blue
        default:
            mainLabel.text = "Third segment"
            mainLabel.textColor = .red
        
        }
    }
    
    @IBAction func sliderAction() {
        mainLabel.text = slider.value.formatted()
        view.backgroundColor = view.backgroundColor?.withAlphaComponent(CGFloat(slider.value))
    }
    
    @IBAction func doneButtonAction() {
        guard let inputText = textField.text, !inputText.isEmpty else {
            showAlert(withTitle: "Text field is empty", andMessage: "Please, enter text")
            return
        }
        
//        if let _ = Double(inputText) {
//            showAlert(withTitle: "Invalid input", andMessage: "Please, enter correct text")
//            return
//        }
//        mainLabel.text = inputText
//        textField.text = ""
        
        let usernamePattern = "^[a-zA-Z ]{3,20}$"
        let isUserNameValid = NSPredicate(format: "SELF MATCHES %@", usernamePattern)
            .evaluate(with: inputText)
        
        if !isUserNameValid {
            showAlert(withTitle: "Invalid input", andMessage: "Please, enter correct text")
            return
        }
    }
    
    // MARK: - Private Methods
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.textField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - Setup UI
extension ViewController {
    private func setupMainLabel() {
        mainLabel.text = slider.value.formatted()
        mainLabel.font = .systemFont(ofSize: 35)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2
    }
    
    private func setupSlider() {
        slider.value = 1
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .green
    }
}

