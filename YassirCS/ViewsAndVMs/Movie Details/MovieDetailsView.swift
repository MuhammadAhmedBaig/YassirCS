//
//  MovieDetailsView.swift
//  YassirCS
//
//  Created by Muhammad Ahmed Baig on 12/10/2022.
//

import UIKit

class MovieDetailsView: UIViewController {
    
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    var imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        return imgView
    }()
    
    var titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Orphan: First Kill"
        lbl.numberOfLines = 3
        lbl.font = UIFont.boldSystemFont(ofSize: 18.0)
        lbl.textColor = .black
        return lbl
    }()
    
    var dateOfReleaseLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "---"
        lbl.numberOfLines = 1
        lbl.font = UIFont.systemFont(ofSize: 14.0)
        lbl.textColor = .black
        return lbl
    }()
    
    var descriptionLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "After escaping from an Estonian psychiatric facility, Leena Klammer travels to America by impersonating Esther, the missing daughter of a wealthy family. But when her mask starts to slip, she is put against a mother who will protect her family from the murderous “child” at any cost.After escaping from an Estonian psychiatric facility, Leena Klammer travels to America by impersonating Esther, the missing daughter of a wealthy family. But when her mask starts to slip, she is put against a mother who will protect her family from the murderous “child” at any cost.After escaping from an Estonian psychiatric facility, Leena Klammer travels to America by impersonating Esther, the missing daughter of a wealthy family. But when her mask starts to slip, she is put against a mother who will protect her family from the murderous “child” at any cost.After escaping from an Estonian psychiatric facility, Leena Klammer travels to America by impersonating Esther, the missing daughter of a wealthy family. But when her mask starts to slip, she is put against a mother who will protect her family from the murderous “child” at any cost."
        lbl.numberOfLines = 0
        lbl.font = UIFont.systemFont(ofSize: 16.0)
        lbl.textColor = .black
        return lbl
    }()
    
    init() {
//        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
//        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.setupNavTitle()
        self.addViews()
        self.setupConstriants()
    }
    
    private func setupNavTitle() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        title = Constants.ScreenTitle.homeTitle.rawValue
    }
    
    // MARK: - Add Views and Setup Constraints
    private func addViews() {
        self.view.backgroundColor = .white
        self.view.addSubview(self.scrollView)
        self.contentView.addSubview(self.imageView)
        self.contentView.addSubview(self.titleLbl)
        self.contentView.addSubview(self.dateOfReleaseLbl)
        self.contentView.addSubview(self.descriptionLbl)
        self.scrollView.addSubview(contentView)
    }
    
    private func setupConstriants() {
        self.setupConstraintsForScrollView()
        self.setupConstraintsForContentView()
        
        self.setupConstraintsForImageView()
        self.setupConstraintsForTitleLbl()
        self.setupConstraintsForDateOfReleaseLbl()
        self.setupConstraintsForDescriptionLbl()
        
        self.imageView.setImage(from: "https://image.tmdb.org/t/p/original/AeyiuQUUs78bPkz18FY3AzNFF8b.jpg", forID: 123)
    }
    
    private func setupConstraintsForScrollView() {
        let guideLine = self.view.safeAreaLayoutGuide
        self.scrollView.topAnchor.constraint(equalTo: guideLine.topAnchor).isActive = true
        self.scrollView.leftAnchor.constraint(equalTo: guideLine.leftAnchor).isActive = true
        self.scrollView.rightAnchor.constraint(equalTo: guideLine.rightAnchor).isActive = true
        self.scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        self.scrollView.bottomAnchor.constraint(equalTo: guideLine.bottomAnchor).isActive = true
    }
    
    private func setupConstraintsForContentView() {
        self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor).isActive = true
        self.contentView.leftAnchor.constraint(equalTo: self.scrollView.leftAnchor).isActive = true
        self.contentView.rightAnchor.constraint(equalTo: self.scrollView.rightAnchor).isActive = true
        self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor).isActive = true
    }
    
    private func setupConstraintsForImageView() {
        self.imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16).isActive = true
        self.imageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 16).isActive = true
        self.imageView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -16).isActive = true
        self.imageView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4).isActive = true
    }
    
    private func setupConstraintsForTitleLbl() {
        self.titleLbl.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 10).isActive = true
        self.titleLbl.leftAnchor.constraint(equalTo: self.imageView.leftAnchor).isActive = true
        self.titleLbl.rightAnchor.constraint(equalTo: self.imageView.rightAnchor).isActive = true
    }
    
    private func setupConstraintsForDateOfReleaseLbl() {
        self.dateOfReleaseLbl.topAnchor.constraint(equalTo: self.titleLbl.bottomAnchor, constant: 10).isActive = true
        self.dateOfReleaseLbl.leftAnchor.constraint(equalTo: self.titleLbl.leftAnchor).isActive = true
        self.dateOfReleaseLbl.rightAnchor.constraint(equalTo: self.titleLbl.rightAnchor).isActive = true
        self.dateOfReleaseLbl.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func setupConstraintsForDescriptionLbl() {
        self.descriptionLbl.topAnchor.constraint(equalTo: self.dateOfReleaseLbl.bottomAnchor, constant: 10).isActive = true
        self.descriptionLbl.leftAnchor.constraint(equalTo: self.dateOfReleaseLbl.leftAnchor).isActive = true
        self.descriptionLbl.rightAnchor.constraint(equalTo: self.dateOfReleaseLbl.rightAnchor).isActive = true
        self.descriptionLbl.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -32).isActive = true
        self.descriptionLbl.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16).isActive = true
    }
    
}
