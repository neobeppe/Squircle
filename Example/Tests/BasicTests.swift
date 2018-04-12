import XCTest
@testable import Squircle

class BasicTests: XCTestCase {
    
    func testImplementation() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let path = view.layer.squirclePath(with: 10.0)
        XCTAssertNotNil(path)
    }
    
    func testEqualPaths() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let bigRadiusPath = view.layer.squirclePath(with: 100)
        let noRadiusPath = view.layer.squirclePath(with: nil)
        XCTAssert(bigRadiusPath == noRadiusPath)
    }
    
    func testDifferentsPaths() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let radiusPath = view.layer.squirclePath(with: 10)
        let noRadiusPath = view.layer.squirclePath(with: nil)
        XCTAssert(radiusPath != noRadiusPath)
    }
}
