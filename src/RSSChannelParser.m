// RSSParser.m

#import "XMLDigester.h"

#import "RSSItem.h"
#import "RSSChannel.h"

#import "RSSChannelParser.h"

@implementation RSSChannelParser

+ (RSSChannel*) parseRSSChannelFromData: (NSData*) data
{
	RSSChannel* channel = nil;
	
	if (data != nil)
	{
		XMLDigester* digester = [XMLDigester digesterWithData: data];
		if (digester != nil)
		{
			[digester addRule:
				[XMLDigesterObjectCreateRule objectCreateRuleWithClass: [RSSChannel class]]
					forPattern: @"rss/channel"];

			[digester addRule: [XMLDigesterCallMethodWithElementBodyRule callMethodWithElementBodyRuleWithSelector: @selector(setTitle:)]
				forPattern: @"rss/channel/title"];

			[digester addRule: [XMLDigesterCallMethodWithElementBodyRule callMethodWithElementBodyRuleWithSelector: @selector(setLink:)]
				forPattern: @"rss/channel/link"];

			[digester addRule: [XMLDigesterCallMethodWithElementBodyRule callMethodWithElementBodyRuleWithSelector: @selector(setDescription:)]
				forPattern: @"rss/channel/description"];

				[digester addRule:
					[XMLDigesterObjectCreateRule objectCreateRuleWithClass: [RSSItem class]]
						forPattern: @"rss/channel/item"];
				
				[digester addRule: [XMLDigesterCallMethodWithElementBodyRule callMethodWithElementBodyRuleWithSelector: @selector(setTitle:)]
					forPattern: @"rss/channel/item/title"];

				[digester addRule: [XMLDigesterCallMethodWithElementBodyRule callMethodWithElementBodyRuleWithSelector: @selector(setGuid:)]
					forPattern: @"rss/channel/item/guid"];

				[digester addRule: [XMLDigesterCallMethodWithElementBodyRule callMethodWithElementBodyRuleWithSelector: @selector(setDescription:)]
					forPattern: @"rss/channel/item/description"];

				[digester addRule:
					[XMLDigesterAddObjectRule addObjectRuleWithProperty: @"items"]
						forPattern: @"rss/channel/item"];
			
			channel = (RSSChannel*) [digester digest];
		}
	}
	
	return channel;
}

+ (RSSChannel*) parseRSSChannelFromURL: (NSURL*) url
{
	return [self parseRSSChannelFromData: [NSData dataWithContentsOfURL: url]];
}

+ (RSSChannel*) parseRSSChannelFromFile: (NSString*) path
{
	return [self parseRSSChannelFromData: [NSData dataWithContentsOfFile: path]];
}

@end
