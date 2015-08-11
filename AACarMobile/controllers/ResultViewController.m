//
//  ResultViewController.m
//  AACarMobile
//
//  Created by Develop on 11.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import "ResultViewController.h"

@implementation ResultViewController



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _result.count;
}


-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
