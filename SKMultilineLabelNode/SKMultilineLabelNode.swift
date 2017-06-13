/*
* Copyright (c) 2017 Konrad Bajtyngier
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import SpriteKit


class SKMultilineLabelNode: SKNode {
	
	var text:String { didSet { configure() } }
	var fontName:String? { didSet { configure() } }
	var fontSize:CGFloat { didSet { configure() } }
	var fontColor:SKColor { didSet { configure() } }
	var lineHeight:CGFloat { didSet { configure() } }
	var horizontalAlignment:SKLabelHorizontalAlignmentMode { didSet { configure() } }
	var verticalAlignment:SKLabelVerticalAlignmentMode { didSet { configure() } }
	
	private var labels:[SKLabelNode] = []
	
	public var height:CGFloat {
		return CGFloat(labels.count) * lineHeight - (lineHeight - fontSize)
	}
	
	init(text:String, fontName:String? = nil, fontSize:CGFloat, fontColor:SKColor = SKColor.white, lineHeight:CGFloat? = nil, horizontalAlignment:SKLabelHorizontalAlignmentMode = .center, verticalAlignment:SKLabelVerticalAlignmentMode = .center) {
		self.text = text
		self.fontName = fontName
		self.fontSize = fontSize
		self.fontColor = fontColor
		self.lineHeight = lineHeight ?? fontSize
		self.horizontalAlignment = horizontalAlignment
		self.verticalAlignment = verticalAlignment == .baseline ? .bottom : verticalAlignment
		super.init()
		self.configure()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configure() {
		//Clear current labels if any
		for label in labels {
			label.removeFromParent()
		}
		labels = []
		//Retrieve lines from text
		let lines = text.components(separatedBy: "\n")
		//Helper for vertical aligment in center
		let alignmentHelper = floor(Double(lines.count)/2.0)
		//Add a separate label per line
		for (i,line) in lines.enumerated() {
			let label = SKLabelNode()
			label.text = line
			if let font = fontName {
				label.fontName = font
			}
			label.fontSize = fontSize
			label.fontColor = fontColor
			label.horizontalAlignmentMode = horizontalAlignment
			label.verticalAlignmentMode = verticalAlignment
			label.position = .zero
			if lines.count > 0 {
				switch verticalAlignment {
				case .bottom:
					label.position.y = CGFloat(lines.count - 1 - i) * lineHeight
				case .center:
					label.position.y = -CGFloat(-alignmentHelper + (lines.count % 2 == 0 ? Double(i)+0.5 : Double(i))) * lineHeight
				default:
					label.position.y = CGFloat(i) * lineHeight
				}
			}
			addChild(label)
			labels.append(label)
		}
	}
}
