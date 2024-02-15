//
//  HomeTableViewModel.swift
//  MVVCEsdla
//
//  Created by Daniel Serrano on 14/10/23.
//

import Foundation

protocol HomeTableViewModelProtocol{
    func onViewAppear()
    func data(at index: Int) -> ImageCellModel?
    func onItemSelected(at index: Int)
}

final class HomeTableViewModel{
    
    private weak var viewDelegate: HomeTableViewProtocol?
    private var viewData = [ImageCellModel]()
    private var mapperHome: MapperCharacterToImageCellModel
    
    init(viewDelegate: HomeTableViewProtocol?,mapperHome: MapperCharacterToImageCellModel) {
        self.viewDelegate = viewDelegate
        self.mapperHome = mapperHome
    }
    
    private func loadData(){
        viewData = mapperHome.map(sampleCharacterData)
        viewDelegate?.updateViews()
    }
}

extension HomeTableViewModel: HomeTableViewModelProtocol{

    func onViewAppear() {
        loadData()
    }
    
    func onItemSelected(at index: Int) {
            guard let data = data(at:index) else {return}
        let detailData = DetailModel(
            name: data.name ,
            image: data.image ?? "",
            description: sampleCharacterData[index].description,
            job: data.job
        )
        
        viewDelegate?.goToDetail(with: detailData)
    }
    
    func data(at index: Int) -> ImageCellModel? {
        guard index < dataCount else {return nil}
        return viewData[index]
    }
    
    var dataCount: Int {
        viewData.count
    }
}
