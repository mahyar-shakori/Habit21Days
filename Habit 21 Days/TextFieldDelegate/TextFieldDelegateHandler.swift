//
//  File.swift
//  Habit 21 Days
//
//  Created by Mahyar on 1/8/24.
//

import UIKit

final class TextFieldDelegateHandler: NSObject, UITextFieldDelegate {
    
    weak var uiHandlerTextChange: TextFieldDelegateUIHandlerTextChange?
    weak var uiHandlerTextEditing: TextFieldDelegateUIHandlerTextEditing?
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if let textFieldName = textField.accessibilityIdentifier {
            uiHandlerTextEditing?.userNameTextFieldDidBeginEditing(textFieldName: textFieldName)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let textFieldName = textField.accessibilityIdentifier {
            uiHandlerTextEditing?.userNameTextFieldDidEndEditing(textFieldName: textFieldName)
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text,
           let textRange = Range(range, in: text),
           let textFieldName = textField.accessibilityIdentifier {
            let updatedText = text.replacingCharacters(in: textRange, with: string)
            uiHandlerTextChange?.userNameTextFieldDidChange(textFieldName: textFieldName, isEmpty: updatedText.isEmpty)
        }
        return true
    }
}
