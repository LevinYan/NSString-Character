//
//  NSString+Character.m
//  TestFlag
//
//  Created by LevinYan on 2017/7/5.
//  Copyright © 2017年 LevinYan. All rights reserved.
//

#import "NSString+Character.h"

@implementation NSString (Character)

- (NSUInteger)characterCount
{
    return [self lengthOfBytesUsingEncoding:NSUTF32StringEncoding]/4;
}

- (NSString*)subCharacterAtIndex:(NSUInteger)index
{
    return [self subCharactersAtRange:NSMakeRange(index, 1)];
}
- (NSString*)subCharactersAtRange:(NSRange)range
{
    NSData *data = [self dataUsingEncoding:NSUTF32BigEndianStringEncoding];
    return [[NSString alloc] initWithData:[data subdataWithRange:NSMakeRange(range.location*4, range.length*4)] encoding:NSUTF32BigEndianStringEncoding];
}
- (void)enumerateCharacters:(void (^)(NSString* character, NSUInteger index, BOOL *stop))block
{
    NSData *data = [self dataUsingEncoding:NSUTF32BigEndianStringEncoding];
    for(NSUInteger i = 0; i < data.length/4; i++){
    
        BOOL stop = NO;
        NSString* character = [[NSString alloc] initWithData:[data subdataWithRange:NSMakeRange(i*4, 4)] encoding:NSUTF32BigEndianStringEncoding];
        block(character, i, &stop);
        if(stop)
            break;
    }
}
@end
