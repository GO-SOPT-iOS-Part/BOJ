//
//  CustomPresentationController.swift
//  32th-Go-SOPT-Seminar
//
//  Created by Joon Baek on 2023/04/19.
//

import UIKit

class CustomPresentationController: UIPresentationController {
    
    override var frameOfPresentedViewInContainerView: CGRect {
        guard let containerView = containerView else { return .zero }
        return CGRect(x: 0, y: containerView.bounds.height - 300, width: containerView.bounds.width, height: 300)
    }
}
