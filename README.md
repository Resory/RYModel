RYModel
==============
A sdk make Json transform to Model.

What can RYModel Do?
==============
* Json to Model
* Jsonstr to Model
* Jsons to Models
* Model to Json
* Models to Jsons

How to Use?
==============
#######Json to Model
`
    
      @interface RYUser : NSObject
      @property (nonatomic, weak) NSString *aName;
      @property (nonatomic, assign) int age;
      @property (nonatomic, assign) BOOL sex;
      @end 
      
      @implementation RYUser
      
      @end
      
      
      NSDictionary *aDic = @{@"name":@"resory",
                             @"age":@(29),
                             @"sex":@true,
                             @"grade":@"A"};    
                                   
     RYUser *user = [RYUser ry_modelWithKeyValue:aDic];
     NSLog(@"%@,%d,%d",user.aName,user.age,user.sex);
     // resory,29,1
`
