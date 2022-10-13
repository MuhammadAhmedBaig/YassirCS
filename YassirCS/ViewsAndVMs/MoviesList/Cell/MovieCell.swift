//
//  MovieCell.swift
//  YassirCS
//
//  Created by Muhammad Ahmed Baig on 06/10/2022.
//

import UIKit

class MovieCell: UITableViewCell, IdentifiableCell {
    
    var backView: UIView = {
        let bView = UIView()
        bView.translatesAutoresizingMaskIntoConstraints = false
        bView.backgroundColor = .white
        return bView
    }()
    
    var imgView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        return imgView
    }()
    
    var titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "---"
        lbl.numberOfLines = 3
        lbl.font = UIFont.boldSystemFont(ofSize: 18.0)
        lbl.textColor = .black
        return lbl
    }()
    
    var dateLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "----"
        lbl.numberOfLines = 1
        lbl.font = UIFont.systemFont(ofSize: 12.0)
        lbl.textColor = .black
        return lbl
    }()
    
    override func layoutSubviews() {
        self.imgView.layer.cornerRadius = 8.0
    }
    
    func setupView() {
        // Initialization code
        self.addViews()
        self.setupConstriants()
    }
    
    
    func setupData(fromModel uiModel: MovieUIModel) {
        self.imgView.setImage(from: uiModel.mediaURL)
        self.dateLbl.text = uiModel.releaseDate
        self.titleLbl.text = uiModel.title
    }
    
    // MARK: - Add Views and Setup Constraints
    private func addViews() {
        self.backgroundColor = .white
        self.contentView.addSubview(self.backView)
        self.backView.addSubview(self.titleLbl)
        self.backView.addSubview(self.imgView)
        self.backView.addSubview(self.dateLbl)
    }
    
    private func setupConstriants() {
        self.setupConstraintsForBackView()
        self.setupConstraintsForImageView()
        self.setupConstraintsForTitleLbl()
        self.setupConstraintsForDataLbl()
    }
    
    private func setupConstraintsForBackView() {
        let guideLine = self.contentView.safeAreaLayoutGuide
        
        self.backView.topAnchor.constraint(equalTo: guideLine.topAnchor, constant: 12).isActive = true
        self.backView.leftAnchor.constraint(equalTo: guideLine.leftAnchor, constant: 12).isActive = true
        self.backView.bottomAnchor.constraint(equalTo: guideLine.bottomAnchor, constant: -12).isActive = true
        self.backView.rightAnchor.constraint(equalTo: guideLine.rightAnchor, constant: -12).isActive = true
    }
    
    private func setupConstraintsForImageView() {
        self.imgView.centerYAnchor.constraint(equalTo: self.backView.centerYAnchor).isActive = true
        self.imgView.leftAnchor.constraint(equalTo: self.backView.leftAnchor, constant: 10).isActive = true
        
        self.imgView.heightAnchor.constraint(equalTo: self.backView.heightAnchor, multiplier: 0.8).isActive = true
        self.imgView.widthAnchor.constraint(equalTo: self.imgView.heightAnchor).isActive = true
    }
    
    private func setupConstraintsForTitleLbl() {
        self.titleLbl.topAnchor.constraint(equalTo: imgView.topAnchor).isActive = true
        self.titleLbl.leftAnchor.constraint(equalTo: imgView.rightAnchor, constant: 10).isActive = true
        self.titleLbl.rightAnchor.constraint(equalTo: self.backView.rightAnchor, constant: -10).isActive = true
    }
    
    private func setupConstraintsForDataLbl() {
        self.dateLbl.topAnchor.constraint(equalTo: self.titleLbl.bottomAnchor, constant: 10).isActive = true
        self.dateLbl.bottomAnchor.constraint(equalTo: self.imgView.bottomAnchor).isActive = true
        self.dateLbl.rightAnchor.constraint(equalTo: self.titleLbl.rightAnchor).isActive = true
        self.dateLbl.leftAnchor.constraint(equalTo: self.titleLbl.leftAnchor).isActive = true
        
        self.dateLbl.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
    }
}
