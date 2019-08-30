//
//  ViewController.swift
//  ImageScroller
//
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //scrollView.contentSize = imageView.image!.size
        imageView.frame.size = imageView.image!.size
        scrollView.delegate = self
        //scrollView.maximumZoomScale = 0.1
        //scrollView.maximumZoomScale = 3.0
        //scrollView.zoomScale = 1.0
        
        setZoomParameters(scrollView.bounds.size)
    }
    
    override func viewWillLayoutSubviews() {
        setZoomParameters(scrollView.bounds.size)
    }
    
    func setZoomParameters(_ scrollViewSize: CGSize) {
        let imageSize = imageView.bounds.size
        let widtScale = scrollViewSize.width / imageSize.width
        let heightScale = scrollViewSize.height / imageSize.height
        let minScale = min(widtScale, heightScale)
        
        scrollView.minimumZoomScale = minScale
        scrollView.maximumZoomScale = 3.0
        scrollView.zoomScale = minScale
    }


}
extension ViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
