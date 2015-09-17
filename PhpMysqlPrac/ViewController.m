//
//  ViewController.m
//  PhpMysqlPrac
//
//  Created by SH on 2015. 9. 18..
//  Copyright (c) 2015년 SH. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController{
    //JSON 파싱해서 담아줄 배열
    NSArray *list;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    list = [[NSArray alloc] initWithObjects:@"1st Cell",@"2nd Cell",@"3rd Cell", nil];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [list count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sampleCell"];
    cell.textLabel.text = [list objectAtIndex:indexPath.row];
    return cell;
}


@end
