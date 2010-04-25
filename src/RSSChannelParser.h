// RSSParser.h

#import <Foundation/Foundation.h>

@class RSSChannel;

@interface RSSChannelParser : NSObject {

}

+ (RSSChannel*) parseRSSChannelFromData: (NSData*) data;
+ (RSSChannel*) parseRSSChannelFromURL: (NSURL*) url;
+ (RSSChannel*) parseRSSChannelFromFile: (NSString*) path;

@end