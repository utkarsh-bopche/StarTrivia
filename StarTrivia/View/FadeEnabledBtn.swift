//
//  FadeEnabledBtn.swift
//  StarTrivia
//
//  Created by Apple on 20/08/21.
//

import UIKit

class FadeEnabledBtn : UIButton {
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                UIView.animate(withDuration: 0.2) {
                    self.alpha = 1.0
                }
            }else {
                UIView.animate(withDuration: 0.2) {
                    self.alpha = 0.5
                }
            }
        }
    }
}
