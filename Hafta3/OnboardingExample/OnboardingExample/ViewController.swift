//
//  ViewController.swift
//  OnboardingExample
//
//  Created by Murat on 4.04.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    
    private var index: Int = 0 {
        didSet {
            
            pageControl.currentPage = index
        }
    }
    
    private var contentOffset: Int = 0
    
    private var onboardings = Onboarding.preview()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupPageControl()
        
    }
    
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        
        let nextIndex = index + 1
        if nextIndex < onboardings.count {
            let indexPath = IndexPath(item: nextIndex, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            index = nextIndex
        }
    }
    
    func setupView() {
        let nib = UINib(nibName: "OnboardingCollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "OnboardingCollectionViewCell")
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.isPagingEnabled = true
        self.collectionView.showsHorizontalScrollIndicator = false
    }

    private func setupPageControl() {
        pageControl.numberOfPages = onboardings.count
        pageControl.currentPage = 0
    }
}

extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboardings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCollectionViewCell", for: indexPath) as! OnboardingCollectionViewCell
        
        cell.configureCell(onboarding: onboardings[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = self.collectionView.frame.width
        let height: CGFloat = self.collectionView.frame.height
        let size: CGSize = CGSize.init(width: width, height: height)
        return size
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth = collectionView.frame.size.width
        index = Int(scrollView.contentOffset.x / pageWidth)
    }
}
