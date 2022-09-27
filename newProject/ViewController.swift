import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var isFirstLoad = true
    
    override func viewDidLayoutSubviews() {
        if isFirstLoad {
            initListener(view: self.view)
            isFirstLoad = false
        }
    }
    private func initListener(view: UIView){
        let gesture = UITapGestureRecognizer(
            target: self,
            action: #selector(onViewClickListener(_:))
        )
        view.addGestureRecognizer(gesture)
    }
    
    private func createSquare(
        on view: UIView
    ){
        let square = UIView()
        square.backgroundColor = .randomColor
        view.addSubview(square)
        
        let maxSize = min(view.frame.height, view.frame.width)
        let randomSize = CGFloat.getRandomSize(maxValue: maxSize)
        let randomCoordinates = CGFloat.getRandomCoordinates(
            maxX: view.frame.width - randomSize,
            maxY: view.frame.height - randomSize
        )
        
        square.snp.makeConstraints { (make) in
            make.height
                .width
                .equalTo(randomSize)
            make.top
                .equalTo(randomCoordinates.0)
            make.leading
                .equalTo(randomCoordinates.1)
        }
        
        initListener(view: square)
    }
    
    @objc private func onViewClickListener(_ sender: UITapGestureRecognizer) {
        guard let currentView = sender.view else { return }
        
        for _ in 0..<3 {
            createSquare(on: currentView)
        }
    }
}

