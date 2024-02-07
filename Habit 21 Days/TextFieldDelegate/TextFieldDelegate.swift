//
//  File.swift
//  Habit 21 Days
//
//  Created by Mahyar on 2/7/24.
//

import UIKit

protocol TextFieldDelegateUIHandlerTextEditing: AnyObject {
    func userNameTextFieldDidBeginEditing(textFieldName: String)
    func userNameTextFieldDidEndEditing(textFieldName: String)
}

protocol TextFieldDelegateUIHandlerTextChange: AnyObject {
    func userNameTextFieldDidChange(textFieldName: String, isEmpty: Bool)
}
