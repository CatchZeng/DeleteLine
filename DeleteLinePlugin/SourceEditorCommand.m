//
//  SourceEditorCommand.m
//  DeleteLinePlugin
//
//  Created by catch on 2016/10/8.
//  Copyright © 2016年 catch. All rights reserved.
//

#import "SourceEditorCommand.h"

@implementation SourceEditorCommand

- (void)performCommandWithInvocation:(XCSourceEditorCommandInvocation *)invocation completionHandler:(void (^)(NSError * _Nullable nilOrError))completionHandler
{
    //有选中了才删除
    if (invocation.buffer.selections.count != 0) {
        XCSourceTextRange* firstObject = invocation.buffer.selections.firstObject;
        
        //开始删除的位置
        NSUInteger start = firstObject.start.line;
        //删除的行数
        NSUInteger len = firstObject.end.line - start +1;
        //Index Set
        NSIndexSet* set = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(start,len)];
        //移除指定代码
        [invocation.buffer.lines removeObjectsAtIndexes:set];
    }
    completionHandler(nil);
}

@end
