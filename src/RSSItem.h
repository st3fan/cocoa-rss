// RSSItem.h

#import <Foundation/Foundation.h>

@interface RSSItem : NSObject {
  @private
	NSString* _title;
	NSString* _link;
	NSString* _description;
	NSString* _guid;
}

@property (nonatomic,retain) NSString* title;
@property (nonatomic,retain) NSString* link;
@property (nonatomic,retain) NSString* description;
@property (nonatomic,retain) NSString* guid;

@end