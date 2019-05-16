import XCTest
@testable import Squircle

class BasicTests: XCTestCase {
    
    func testImplementation() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.squircle()
        
        // Test that we have a squircle mask
        var mask = view.layer.mask
        XCTAssertNotNil(mask)
        
        // Test that we can remove the squircle
        view.removeSquircle()
        mask = view.layer.mask
        XCTAssertNil(mask)
    }
    
    func testPoints() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let path = view.layer.squirclePath
        
        let zeroPoint = CGPoint.zero
        XCTAssertFalse(path.contains(zeroPoint))
        
        let midPoint = view.center
        XCTAssertTrue(path.contains(midPoint))
        
        XCTAssertNotNil(path)
    }
    
    func testBorderImplementation() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.squircleWithBorder(width: 5.0, color: .orange)
        
        // Test that we have a border
        var count = borderCount(view: view)
        XCTAssertTrue(count == 1)
        
        // Test that we can remove border
        view.removeSquircleBorder()
        count = borderCount(view: view)
        XCTAssertTrue(count == 0)
    }
    
    func borderCount(view: UIView) -> Int {
        return view.layer.sublayers?.filter({ $0.name == squircleBorderName }).count ?? 0
    }
}
