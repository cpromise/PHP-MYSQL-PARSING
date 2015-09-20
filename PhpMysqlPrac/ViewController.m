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
    NSMutableArray *list;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //가장 먼저 데이터를 셋팅
    [self getData];
    
    //델리게이트는 셀프로
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
    cell.textLabel.text = [[list objectAtIndex:indexPath.row] objectForKey:@"name"];
    return cell;
}

- (void)getData{
    NSString *url = @"http://cpromise.cafe24.com/lunch/getRestList.php";
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL: [NSURL URLWithString:url]
                                                           cachePolicy: NSURLRequestReloadIgnoringCacheData
                                                       timeoutInterval:60];
    [request setHTTPMethod:@"GET"];
    [NSURLConnection connectionWithRequest:request delegate:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    NSString *strReturn = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@",strReturn);
    NSError *error = nil;
    id tmp = [NSJSONSerialization JSONObjectWithData:[strReturn dataUsingEncoding:NSUTF8StringEncoding]
                                             options:NSJSONReadingMutableContainers
                                               error:&error];
    list = [[NSMutableArray alloc] initWithArray: (NSMutableArray *)tmp];
    
    //데이터를 다 받았으면 테이블에 값들을 새로고침 해줘야합니다.
    [_tableView reloadData];
}
@end
