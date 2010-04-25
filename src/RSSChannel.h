// RSSChannel.h

#import <Foundation/Foundation.h>

@interface RSSChannel : NSObject {
  @private
    NSString* _title;
    NSString* _link;
    NSString* _description;
	NSMutableArray* _items;
}

@property (nonatomic,retain) NSString* title;
@property (nonatomic,retain) NSString* link;
@property (nonatomic,retain) NSString* description;
@property (nonatomic,readonly) NSMutableArray* items;

@end