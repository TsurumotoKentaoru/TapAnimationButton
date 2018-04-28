//
//  TapAnimationButton.swift
//  TapAnimationButton
//
//  Created by 鶴本賢太朗 on 2018/04/28.
//  Copyright © 2018年 Kentarou Tsurumoto. All rights reserved.
//

import UIKit

// 押した時にスケールを縮小・拡大するクラス
class ChangeScaleButton: UIButton {
    
    private let animationMargin: CGFloat = 3
    private let animationTime: TimeInterval = 0.2
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.animation(rect: self.animatedRect(_margin: self.animationMargin))
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.animation(rect: self.animatedRect(_margin: -self.animationMargin))
    }
    
    // MARK: アニメーション後のframeを取得する
    private func animatedRect(_margin: CGFloat) -> CGRect {
        var rect: CGRect = self.frame
        rect.origin.x += _margin
        rect.origin.y += _margin
        rect.size.width -= _margin * 2
        rect.size.height -= _margin * 2
        return rect
    }
    
    // MARK: スケール変更のアニメーションを行う
    private func animation(rect: CGRect) {
        UIView.animate(withDuration: self.animationTime) {
            self.frame = rect
        }
    }
}
