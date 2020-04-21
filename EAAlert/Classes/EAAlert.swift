//
//  EAAlert.swift
//  EAAlert
//
//  Created by Emre AYDIN on 14.01.2020.
//  Copyright © 2019 Emre AYDIN. All rights reserved.
//

import UIKit

/// messageType: none, success or error.
public enum MessageType: Int {
    case none = 0
    case success
    case error
}

open class EAAlert: UIView {
    
    /// messageType: none, success or error. Changeable images available when success or error types selected.
    public var messageType = MessageType.none {
        didSet {
            switch messageType {
            case MessageType.success:
                labelCenterYAnchor = -25
                image = successButtonImage
            case MessageType.error:
                labelCenterYAnchor = -25
                image = errorButtonImage
            case MessageType.none:
                labelCenterYAnchor = 0
                image = nil
            }
        }
    }
    
    /// blurEffectStyle: Blur effect style
    open var blurEffectStyle = UIBlurEffect.Style.light
    
    /// alertBackgroundColor: Backgroundcolor of alert view
    open var alertBackgroundColor = UIColor.white
    
    /// messageLabelFont: Font of message label
    open var messageLabelFont = UIFont.systemFont(ofSize: 23)
    
    /// messageLabelColor: Color of message label
    open var messageLabelColor = UIColor(red: 43/255.0, green: 37/255.0, blue: 72/255.0, alpha: 1)
    
    /// closeButtonImage: Success image
    open var closeButtonImage = UIImage(named: "close-red", in: Bundle(for: EAAlert.self), compatibleWith: nil)
    
    /// successButtonImage: Success image
    open var successButtonImage = UIImage(named: "success", in: Bundle(for: EAAlert.self), compatibleWith: nil)
    
    /// errorButtonImage: Error image
    open var errorButtonImage = UIImage(named: "error", in: Bundle(for: EAAlert.self), compatibleWith: nil)
    
    /// isPositiveButtonHidden: If you set as false, positive button will be visible
    open var isPositiveButtonHidden = true
    
    /// isNegativeButtonHidden: If you set as false, negativfe button will be visible
    open var isNegativeButtonHidden = true
    
    /// positiveButtonText: Posiive button text
    open var positiveButtonText = "Yes"
    
    /// positiveButtonText: Negative button text
    open var negativeButtonText = "No"
    
    /// positiveButtonTextColor: Positive button label color
    open var positiveButtonTextColor = UIColor(red: 157/255.0, green: 37/255.0, blue: 41/255.0, alpha: 1)
    
    /// negativeButtonTextColor: Negative button label color
    open var negativeButtonTextColor = UIColor(red: 157/255.0, green: 37/255.0, blue: 41/255.0, alpha: 1)
    
    /// messageLabelFont: Font of message label
    open var positiveButtonTextFont = UIFont.boldSystemFont(ofSize: 20)
    
    /// messageLabelFont: Font of message label
    open var negativeButtonTextFont = UIFont.boldSystemFont(ofSize: 20)
    
    // Click Events:
    
    /// onAlertCloseTapped: Called when alert closed.
    open var onAlertCloseTapped: (()->(Void))?
    
    /// onPositiveButtonTapped: Called when positive button pressed.
    open var onPositiveButtonTapped: (()->(Void))?
    
    /// onNegativeButtonTapped: Called when negative button pressed.
    open var onNegativeButtonTapped: (()->(Void))?
    
    private var image: UIImage!
    private var labelCenterYAnchor: CGFloat = 0
    
    private var _message = ""
    private var eaView: UIView?
    
    private lazy var bundle: Bundle = Bundle(for: EAAlert.self)
    
    /// show: Call it whenever you want to show the alert.
    public func show() {
        showAlert(_message)
    }
    
    /// setMessage: You can update the alert message with using this function.
    open func setMessage(_ message: String) {
        _message = message
    }
    
    public init() {
        super.init(frame: CGRect.zero)
    }
    
    public init(message: String) {
        super.init(frame: CGRect.zero)
        
        _message = message
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func showAlert( _ message: String) {
        DispatchQueue.main.async {
            if let window = UIApplication.shared.keyWindow {
                let superview = UIView(frame: window.bounds)
                if #available(iOS 10.0, *) {
                    let blurEffect = UIBlurEffect(style: self.blurEffectStyle)
                    let blurEffectView = UIVisualEffectView(effect: blurEffect)
                    blurEffectView.frame = window.bounds
                    blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                    superview.addSubview(blurEffectView)
                }
                
                let labelWidth: CGFloat = 250
                let labelHeight = message.getHeight(labelWidth, self.messageLabelFont)
                let messageTypeIconHeight: CGFloat = (self.messageType == MessageType.none) ? 0 : 50
                let isActionButtonsContainerViewVisible = !self.isPositiveButtonHidden || !self.isNegativeButtonHidden
                let actionButtonsContainerViewHeight: CGFloat = isActionButtonsContainerViewVisible ? 36 : 0
                
                
                let contentView = UIView()
                contentView.backgroundColor = self.alertBackgroundColor
                contentView.layer.cornerRadius = 8
                contentView.layer.shadowColor = UIColor.black.cgColor
                contentView.layer.shadowOpacity = 0.13
                contentView.layer.shadowOffset = CGSize.zero
                contentView.layer.shadowRadius = 8
                
                superview.addSubview(contentView)
                
                contentView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    contentView.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
                    contentView.centerYAnchor.constraint(equalTo: superview.centerYAnchor),
                    contentView.widthAnchor.constraint(greaterThanOrEqualToConstant: 300),
                    contentView.heightAnchor.constraint(equalToConstant: labelHeight+messageTypeIconHeight+actionButtonsContainerViewHeight+144)
                    ])
                
                
                let label = UILabel()
                label.font = self.messageLabelFont
                label.textColor = self.messageLabelColor
                label.textAlignment = .center
                label.numberOfLines = 0
                label.text = message
                contentView.addSubview(label)
                
                label.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                    label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: self.labelCenterYAnchor),
                    label.widthAnchor.constraint(equalToConstant: labelWidth),
                    label.heightAnchor.constraint(equalToConstant: labelHeight)
                    ])
                
                
                let button = UIButton()
                button.setImage(self.closeButtonImage, for: .normal)
                button.addTarget(self, action: #selector(self.closeButtonTapped), for: .touchUpInside)
                contentView.addSubview(button)
                
                button.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                    button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
                    button.widthAnchor.constraint(equalToConstant: 20),
                    button.heightAnchor.constraint(equalToConstant: 20)
                    ])
                
                
                let informationButton = UIButton()
                informationButton.setImage(self.image, for: .normal)
                contentView.addSubview(informationButton)
                
                informationButton.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    informationButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                    informationButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: messageTypeIconHeight/4),
                    informationButton.widthAnchor.constraint(equalToConstant: 50),
                    informationButton.heightAnchor.constraint(equalToConstant: 50)
                    ])
                
                informationButton.addTarget(self, action: #selector(self.informationButtonTapped), for: .touchUpInside)
                
                
                if isActionButtonsContainerViewVisible {
                    let actionButtonsContainerView = UIStackView()
                    actionButtonsContainerView.axis = .horizontal
                    actionButtonsContainerView.distribution = .fillEqually
                    contentView.addSubview(actionButtonsContainerView)
                    
                    actionButtonsContainerView.translatesAutoresizingMaskIntoConstraints = false
                    NSLayoutConstraint.activate([
                        actionButtonsContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                        actionButtonsContainerView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                        actionButtonsContainerView.widthAnchor.constraint(equalToConstant: 270),
                        actionButtonsContainerView.heightAnchor.constraint(equalToConstant: 50)
                        ])
                    
                    if !self.isNegativeButtonHidden {
                        let negativeButton = UIButton()
                        negativeButton.setTitleColor(self.negativeButtonTextColor, for: .normal)
                        negativeButton.titleLabel?.font = self.negativeButtonTextFont
                        negativeButton.setTitle(self.negativeButtonText, for: .normal)
                        actionButtonsContainerView.addArrangedSubview(negativeButton)
                        
                        negativeButton.addTarget(self, action: #selector(self.negativeButtonTapped), for: .touchUpInside)
                    }
                    
                    if !self.isPositiveButtonHidden {
                        let positiveButton = UIButton()
                        positiveButton.setTitleColor(self.positiveButtonTextColor, for: .normal)
                        positiveButton.titleLabel?.font = self.positiveButtonTextFont
                        positiveButton.setTitle(self.positiveButtonText, for: .normal)
                        actionButtonsContainerView.addArrangedSubview(positiveButton)
                        
                        positiveButton.addTarget(self, action: #selector(self.positiveButtonTapped), for: .touchUpInside)
                    }
                }
                
                self.eaView = superview
                if let eaView = self.eaView {
                    window.addSubview(eaView)
                }
            }
        }
    }
    
    @objc private func informationButtonTapped() {
        onAlertCloseTapped?()
        removeAlert()
    }
    
    @objc private func closeButtonTapped() {
        onAlertCloseTapped?()
        removeAlert()
    }
    
    @objc private func positiveButtonTapped() {
        onPositiveButtonTapped?()
        removeAlert()
    }
    
    @objc private func negativeButtonTapped() {
        onNegativeButtonTapped?()
        removeAlert()
    }
    
    private func removeAlert() {
        if let eaView = eaView {
            eaView.removeFromSuperview()
        }
    }
}
