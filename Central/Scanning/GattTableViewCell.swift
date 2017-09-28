//
//  PeripheralTableViewCell.swift
//  Services
//
//  Created by Adonis Gaitatzis on 11/21/16.
//  Copyright © 2016 Adonis Gaitatzis. All rights reserved.
//

import UIKit
import CoreBluetooth

/**
 GATT Characteristic Table View Cell
 */
class GattTableViewCell: UITableViewCell {
    
    // MARK: UI Elements
    @IBOutlet weak var uuidLabel: UILabel!
    @IBOutlet weak var readableLabel: UILabel!
    @IBOutlet weak var writeableLabel: UILabel!
    @IBOutlet weak var noAccessLabel: UILabel!
    
    
    /**
     Render the cell with Characteristic properties
     */
    func renderCharacteristic(characteristic: CBCharacteristic) {
        uuidLabel.text = characteristic.uuid.uuidString
        
        let isReadable = BlePeripheral.isCharacteristic(isReadable: characteristic)
        let isWriteable = BlePeripheral.isCharacteristic(isWriteable: characteristic)
        
        readableLabel.isHidden = !isReadable
        writeableLabel.isHidden = !isWriteable
        
        if isReadable || isWriteable {
            noAccessLabel.isHidden = true
        } else {
            noAccessLabel.isHidden = false
        }
        
    }

}
