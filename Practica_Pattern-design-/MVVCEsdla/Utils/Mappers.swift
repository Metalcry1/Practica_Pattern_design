//
//  Mappers.swift
//  MVVCEsdla
//
//  Created by Daniel Serrano on 15/2/24.
//

import Foundation

protocol MapperCharacterToImageCellModel {
    func map(_ characters: CharactersModel?) -> [ImageCellModel]
    func map(_ character: CharacterModel?) -> ImageCellModel?
}

class MapperToHome: MapperCharacterToImageCellModel {
    
    func map(_ characters: CharactersModel?) -> [ImageCellModel] {
        guard let characters = characters else {return []}
        return characters.compactMap{ map($0)}
        
    }
    
    func map(_ character: CharacterModel?) -> ImageCellModel? {
        guard let character = character else {return nil}
        return ImageCellModel(image: character.image, name: character.name, job: character.job )
    }
}
