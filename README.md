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
NSDictionary *aDic = @{@"name":@"resory",
                           @"age":@(29),
                           @"sex":@true,
                           @"grade":@"A",
                           @"course":@{
                                   @"math":@[
                                           @{
                                               @"geometry":@200.42,
                                               @"calculous":@300
                                               },
                                           @{
                                               @"geometry":@100.42,
                                               @"calculous":@99
                                               }
                                           ],
                                   @"english":@(100)
                                   }};
                                   
                                   
`
