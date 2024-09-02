//
//  SomeSfSymbolsswift
//  Forelesning3
//
//  Created by Edouard Siegel on 02/09/2024
//

import Foundation

enum SomeSfSymbols: String, CaseIterable, Identifiable {

    case squareandarrowup = "square.and.arrow.up"
    case pencilcircle = "pencil.circle"
    case penciltipcropcirclebadgearrowforward = "pencil.tip.crop.circle.badge.arrow.forward"
    case folderfillbadgeminus = "folder.fill.badge.minus"
    case trayfill = "tray.fill"
    case xmarkbincirclefill = "xmark.bin.circle.fill"
    case arrowshapeturnupbackwardbadgeclockfill = "arrowshape.turn.up.backward.badge.clock.fill"
    case menucard = "menucard"
    case linkbadgeplus = "link.badge.plus"
    case person2slash = "person.2.slash"
    case arrowupandpersonrectangleturnright = "arrow.up.and.person.rectangle.turn.right"
    case figureracquetball = "figure.racquetball"
    case sportscourtcircle = "sportscourt.circle"
    case cricketballcircle = "cricket.ball.circle"
    case restart = "restart"
    case sunminfill = "sun.min.fill"
    case moonphasenewmooninverse = "moonphase.new.moon.inverse"

    var id: Self { self }

}
