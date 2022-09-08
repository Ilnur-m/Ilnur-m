//
//  NoteValue.swift
//
//  Created by Roel Spruit on 03/12/15.
//  Copyright © 2015 DinkyWonder. All rights reserved.
//

import Foundation

public enum NoteValue: Int {
    
    case ThirtySecond  = 32
    case Sixteenth  = 16
    case twelve     = 12
    case eleven     = 11
    case ten        = 10
    case nine       = 9
    case Eight      = 8
    case seven      = 7
    case six        = 6
    case five       = 5
    case Quarter    = 4
    case three      = 3
    case Half       = 2
    case Whole      = 1
    
    func numberOfNotesInNote(note: NoteValue) -> Double{
        return Double(self.rawValue) / Double(note.rawValue)
    }
    
    func timeIntervalWithTempo(tempo: Int, tempoNote: NoteValue) -> UInt64 {
        
        // работает почему-то медленно
        
        let secondsBetweenBeats = 60.0 / Double(tempo)
        let secondsForNote = secondsBetweenBeats / Double(numberOfNotesInNote(note: tempoNote))
        let time = TimeBase.toAbs(nanos: secondsForNote * Double(TimeBase.NANOS_PER_SEC))
//        print("time: $\(time)")
        return time
        
//        let secondsBetweenBeats = Double(tempo)
//        let secondsForNote = secondsBetweenBeats / Double(numberOfNotesInNote(note: tempoNote))
//        let time = TimeBase.toAbs(nanos: 60 / secondsForNote * Double(TimeBase.NANOS_PER_SEC))
//        print("time: $\(time)")
//        return time
    }
}

private class TimeBase {
    static let NANOS_PER_USEC: UInt64 = 1000
    static let NANOS_PER_MILLISEC: UInt64 = 1000 * NANOS_PER_USEC
    static let NANOS_PER_SEC: UInt64 = 1000 * NANOS_PER_MILLISEC
    
    static var timebaseInfo: mach_timebase_info! = {
        var tb = mach_timebase_info(numer: 0, denom: 0)
        let status = mach_timebase_info(&tb)
        if status == KERN_SUCCESS {
            return tb
        } else {
            return nil
        }
    }()
    
    static func toNanos(abs: UInt64) -> UInt64 {
        return (abs * UInt64(timebaseInfo.numer)) / UInt64(timebaseInfo.denom)
    }
    
    static func toAbs(nanos: Double) -> UInt64 {
        let absoluteTime = (nanos * Double(timebaseInfo.denom)) / Double(timebaseInfo.numer)
        return UInt64(absoluteTime)
    }
}
