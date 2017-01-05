# CreateModelFromJson

> 将JSON字典转换为Model文件

![demo.png](http://images0.cnblogs.com/blog2015/607542/201506/031958140234662.png)


-------关于--creatModel--的具体用法------------


NSDictionary *data = @{@"name"       : @"YouXianMing",
@"age"        : @(6),
@"address"    : @[@"北京", @"通州北苑"],
@"infomation" : @{@"A" : @"B"}};

// 创建文件
[CreateModel createFileWithModelName:@"Model"
dictionary:data]; 

生成的 model 在document 文件里面可以找到