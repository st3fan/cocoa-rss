// RSSItem.m

#import "RSSItem.h"

@implementation RSSItem

@synthesize title = _title;
@synthesize link = _link;
@synthesize description = _description;
@synthesize guid = _guid;

- (id) init
{
	if ((self = [super init]) != nil) {
	}
	return self;
}

- (void) dealloc
{
	[_title release];
	[_link release];
	[_description release];
	[_guid release];
	[super dealloc];
}

@end