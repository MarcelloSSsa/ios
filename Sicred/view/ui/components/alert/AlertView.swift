//
//  AlertView.swift
//  Sicred
//
//  Created by Marcello Da Silva Sousa on 13/11/20.
//

import UIKit

class AlertView: ViewFromNib {
    
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var alertTitle: UILabel!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var nome: UITextField!
    @IBOutlet weak var alertPositiveButton: UIButton!
    
    var positiveAction = {}
    var isCancelable = false
    
    // needed in order to outlets to work
    private var _self: AlertView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        _self = self
        
        parentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        parentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.onClickOutside(_:)))
        parentView.addGestureRecognizer(tapGesture)
    }
    
    @objc func onClickOutside(_ sender: UITapGestureRecognizer) {
        if(isCancelable){
            self.dismiss()
        }
    }
    
    func showAlert(title: String? = "", positiveButton: String? = nil) {
        
        self.alertTitle.text = title
        
        alertPositiveButton.setTitle(positiveButton, for: .normal)
        
        alertView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        parentView.alpha = 0.0
        
        UIView.transition(with: self.view, duration: 0.3, options: [.transitionCrossDissolve], animations: {
            UIApplication.shared.windows.first { $0.isKeyWindow }?.addSubview(self.parentView)
            self.parentView.alpha = 1.0
            self.alertView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
    }
    
    private func dismiss(){
        UIView.transition(with: self.view, duration: 0.3, options: [.transitionCrossDissolve], animations: {
            self.alertView.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
            self.parentView.alpha = 0.0
        }, completion: {_ in self.parentView.removeFromSuperview() })
    }
    
    @IBAction func positiveButtonAction(_ sender: Any) {
        
        positiveAction()
        dismiss()
    }
}

extension AlertView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case textField:
            self.view.endEditing(true)
        default:
            self.view.endEditing(true)
        }
        return false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)

        if !text.isEmpty{
            alertPositiveButton.isUserInteractionEnabled = true
            alertPositiveButton.alpha = 1.0
        } else {
            alertPositiveButton.isUserInteractionEnabled = false
            alertPositiveButton.alpha = 0.5
        }
        return true
    }
}
