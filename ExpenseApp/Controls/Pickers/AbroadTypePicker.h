//
//  AbroadTypePicker.h
//  ExpenseApp
//
//  Created by Bert Outtier on 5/03/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AbroadTypePicker;
@protocol AbroadTypePickerDelegate <NSObject>
@optional
- (void)didSelectType:(int)type withName:(NSString*)name;
@required
@end

@interface AbroadTypePicker : UIPickerView <UIPickerViewDelegate, UIPickerViewDataSource>
{
	id <AbroadTypePickerDelegate> abroadTypePickerDelegate;
}
@property (nonatomic, assign) id <AbroadTypePickerDelegate> abroadTypePickerDelegate;
@property (nonatomic) int type;
@property (nonatomic, strong) NSString* typeName;
- (id)init:(id<AbroadTypePickerDelegate>)delegateObject;

@end
