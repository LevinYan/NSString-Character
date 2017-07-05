//
//  NSString+Character.h
//
//  Created by LevinYan on 2017/7/5.
//  Copyright © 2017年 LevinYan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Character)

@property (nonatomic, assign, readonly) NSUInteger characterCount;


- (NSString*)subCharacterAtIndex:(NSUInteger)index;
- (NSString*)subCharactersAtRange:(NSRange)range;
- (void)enumerateCharacters:(void (^)(NSString* character, NSUInteger index, BOOL *stop))block;

@end
