#import <XCTest/XCTest.h>
#import "NSURL+WMFLinkParsing.h"
#import "NSURLComponents+WMFLinkParsing.h"

@interface WMFLinkParsingTests : XCTestCase

@end

@implementation WMFLinkParsingTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testWMFDomain {
    NSURL* URL = [NSURL URLWithString:@"https://en.wikipedia.org/wiki/Tyrannosaurus"];
    XCTAssertEqualObjects(@"wikipedia.org", URL.wmf_domain);
    XCTAssertEqualObjects(@"en", URL.wmf_language);
    XCTAssertEqualObjects(@"Tyrannosaurus", URL.wmf_title);
}

- (void)testWMFMobileDomain {
    NSURL* URL = [NSURL URLWithString:@"https://en.m.wikipedia.org/wiki/Tyrannosaurus"];
    XCTAssertEqualObjects(@"wikipedia.org", URL.wmf_domain);
    XCTAssertEqualObjects(@"en", URL.wmf_language);
    XCTAssertEqualObjects(@"Tyrannosaurus", URL.wmf_title);
}

- (void)testWMFDomainComponents {
    NSURLComponents* components = [NSURLComponents wmf_componentsWithDomain:@"wikipedia.org" language:@"en" isMobile:NO];
    XCTAssertEqualObjects(@"en.wikipedia.org", components.host);
    components = [NSURLComponents wmf_componentsWithDomain:@"wikipedia.org" language:@"en"];
    XCTAssertEqualObjects(@"en.wikipedia.org", components.host);
}

- (void)testWMFMobileDomainComponents {
    NSURLComponents* components = [NSURLComponents wmf_componentsWithDomain:@"wikipedia.org" language:@"en" isMobile:YES];
    XCTAssertEqualObjects(@"en.m.wikipedia.org", components.host);
}

@end