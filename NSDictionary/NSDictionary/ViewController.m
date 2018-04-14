//
//  ViewController.m
//  NSDictionary
//
//  Created by paul on 4/14/18.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
#pragma mark NSDictionary
    NSAutoreleasePool *pool1 = [[NSAutoreleasePool alloc] init];
    //        Please, find your tasks on NSDictionary and NSMutableDictionary bellow:
    //
    //        Create NSDictionary using literal declaration.
    NSDictionary *dictionaryUsingLiteral = @{@"0": @"NullNumber",
                                             @"1": @"One",
                                             @"2": @"Two",
                                             @"3": @"Three",
                                             @"4": @"Four",
                                             @"5": @"Five",
                                             };
    
    //        Make it mutable and add several new entries.
    dictionaryUsingLiteral = [dictionaryUsingLiteral mutableCopy];
    [(NSMutableDictionary *) dictionaryUsingLiteral setObject:@"SixMutable" forKey:@"6"];
    [(NSMutableDictionary *) dictionaryUsingLiteral setObject:@"SevenMutable" forKey:@"7"];
    
    //        Sort it in an ascending and descending order.
    //        ascending
    NSMutableArray *tempArrayForSortingDictionary = [[dictionaryUsingLiteral allKeys]
                                                     sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
                                                         return [obj1 compare:obj2];
                                                     }];
    
    void(^printDictionaryByOrderedKeysBlock)(NSArray*,NSDictionary*)=^(NSArray* array,
                                                                       NSDictionary* dictionary)
    {
        for (NSString *key in array)
        {
            NSLog(@"%@ = %@", key, [dictionary objectForKey:key]);
        };
    };
    printDictionaryByOrderedKeysBlock(tempArrayForSortingDictionary, dictionaryUsingLiteral);
    
    printDictionaryByOrderedKeysBlock([[tempArrayForSortingDictionary reverseObjectEnumerator]
                                       allObjects], dictionaryUsingLiteral);
    
    
    //        Check whether required value is contained in the dictionary.
    __block id testValue =@"blbablabla";
    
    void(^testIfInTheDictionaryBlock)(void)=^{
        if ([[dictionaryUsingLiteral allKeysForObject:testValue] firstObject]) {
            NSLog(@"%@ is in the dictionary", testValue);
        } else{
            NSLog(@"There no such value as %@", testValue);
        }
    };
    
    testIfInTheDictionaryBlock();
    
    
    testValue = @"Three";
    testIfInTheDictionaryBlock();
    
    [dictionaryUsingLiteral release];
    [pool1 release];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
