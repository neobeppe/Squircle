import XCTest
@testable import Squircle

class BasicTests: XCTestCase {
    
    func testImplementation() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let path = view.layer.squirclePath()
        XCTAssertNotNil(path)
    }
}
