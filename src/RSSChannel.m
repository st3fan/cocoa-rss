// RSSChannel.m

#import "RSSChannel.h"

@implementation RSSChannel

@synthesize title = _title;
@synthesize link = _link;
@synthesize description = _description;
@synthesize items = _items;

- (id) init
{
	if ((self = [super init]) != nil) {
		_items = [NSMutableArray new];
	}
	return self;
}

- (void) dealloc
{
	[_title release];
	[_link release];
	[_description release];
	[_items release];
	[super dealloc];
}

@end