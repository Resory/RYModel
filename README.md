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
### Json to Model
### 
      <# Base Use Start #>
      
            Model:
            @interface RYUser : NSObject
            @property (nonatomic, weak) NSString *name;
            @property (nonatomic, assign) int age;
            @property (nonatomic, assign) BOOL sex;
            @end 
            @implementation RYUser 
            @end

            Json:
            NSDictionary *aDic = @{@"name":@"resory",
                                   @"age":@(29),
                                   @"sex":@true,
                                   @"grade":@"A"};

            Transform: 
            RYUser *user = [RYUser ry_modelWithKeyValue:aDic];
            NSLog(@"%@,%d,%d",user.name,user.age,user.sex);
            // resory,29,1
            
      <# Base Use End #>
      
      <# Model contain model Start #>
      
            Model:
            @interface RYUser : NSObject
            @property (nonatomic, weak) NSString *name;
            @property (nonatomic, assign) int age;
            @property (nonatomic, assign) BOOL sex;
            @end 
            @implementation RYUser 
            @end
            
            @interface RYCourse : NSObject
            @property (nonatomic, assign) CGFloat english;
            @end
            
            @implementation RYMath
            @end

            
            @implementation RYCourse
            @end

            Json:
            NSDictionary *aDic = @{
                                    @"name":@"resory",
                                    @"age":@(29),
                                    @"sex":@true,
                                    @"grade":@"A",
                                    @"course":@{
                                                      @"english":@(100)
                                               }
                                    }

              Transform: 
              RYUser *user = [RYUser ry_modelWithKeyValue:aDic];
              NSLog(@"%@,%d,%d,%@",user.name,user.age,user.sex,user.course.english);
              //resory,29,1,99.500000   
              
      <# Model contain model End #>
