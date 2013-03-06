//
//  ProjectPicker.h
//  ExpenseApp
//
//  Created by Bert Outtier on 5/03/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ProjectPicker;
@protocol ProjectPickerDelegate <NSObject>
@optional
- (void)didSelectProject:(NSString*)project;
@required
@end

@interface ProjectPicker : UIPickerView <UIPickerViewDelegate, UIPickerViewDataSource>
{
	id <ProjectPickerDelegate> projectPickerDelegate;
}
@property (nonatomic, assign) id <ProjectPickerDelegate> projectPickerDelegate;
@property (nonatomic, strong) NSString* project;
- (id)init:(id<ProjectPickerDelegate>)delegateObject;

@end
