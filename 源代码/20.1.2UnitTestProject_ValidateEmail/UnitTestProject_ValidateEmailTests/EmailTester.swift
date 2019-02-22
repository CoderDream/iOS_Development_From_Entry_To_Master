//
//  EmailTester.swift
//  UnitTestProject_ValidateEmail
//
//  Created by Jerry on 16/6/24.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import XCTest
@testable import UnitTestProject_ValidateEmail

class EmailTester: XCTestCase {

    func testEmail()
    {
        let emailUtil = EmailUtil()
        let result = emailUtil.validateEmail(email: "support@coolketang.com")
        XCTAssert(result, "邮箱格式不正确。")
    }
}
