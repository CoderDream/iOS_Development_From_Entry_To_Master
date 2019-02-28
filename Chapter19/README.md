# iOS_Development_From_Entry_To_Master
iOS移动开发从入门到精通 书名：iOS移动开发从入门到精通 作者：李发展　王亮　王金柱 ISBN：9787302462026 本书由清华大学出版社有限公司授权京东阅读电子版制作与发行

目  录                                        
#  第19章  Storyboard故事板的使用 394                          
## 19.1  Storyboard概述 395                                   
### 19.1.1  Storyboard的优缺点 395                             
### 19.1.2  故事板的组织形式 396                               
### 19.1.3  创建一个Storyboard 397              

19.1.3　创建一个Storyboard
使用【Single View Application】模板创建的项目，将自带两个Storyboard文件，一个是Main.storyboard，用于呈现应用程序的主界面。
另一个是LaunchScreen.storyboard文件，用于设计和布局应用程序的启动界面。
如果需要添加更多的Storyboard文件，可以在项目文件夹上点击鼠标右键，弹出右键菜单，然后选择【New File】选项，如图19.4所示。   
![](snapshot\1901_1904.jpg)
图19.4
接着在弹出的模板选择窗口中，依次点击【User Interface>Storyboard】，如图19.5所示。   
![](snapshot\1901_1905.jpg)
图19.5
Storyboard创建后，将在左侧的项目导航区出现一个名为 AnotherStoryboard的Storyboard文件，该Storyboard没有包含任何的视图控制器，如图19.6所示。   
![](snapshot\1901_1906.jpg)
图19.6
由于新建的Storyboard文件内容为空，所以将一个新的视图控制器从右侧的控件库中拖动到中间的故事板区域，如图19.7所示。   
![](snapshot\1901_1907.jpg)
图19.7
在Storyboard中添加视图控制器后，视图控制器的默认尺寸为Inferred，即由系统来决定其大小。为了方便显示，我们可以将其尺寸设置为iPhone 4-inch，如图19.8所示，在底部的【View As】设置面板，选择【iPhone SE】选项作为故事板中视图控制器的尺寸。   
![](snapshot\1901_1908.jpg)
图19.8
接着再为视图控制器的根视图设置背景颜色，首先在控制器的视图区域点击，以选择根视图。然后点击【Show the Attributes inspector】按钮，打开属性观察器面板。在属性观察器面板中，点击背景颜色下拉箭
头，打开颜色设置面板。在颜色面板中，选择绿色作为当前视图控制器根视图的背景颜色，如图19.9所示。   
![](snapshot\1901_1909.jpg)
图19.9

               
### 19.1.4  更改故事板的初始视图控制器 398                
19.1.4　更改故事板的初始视图控制器
在设置完视图控制器之后，需要将该视图控制器作为故事板的初始视图控制器。首先选择当前的视图控制器，然后在右侧的属性观察器面板中，勾选【是否初始视图控制器】复选框，将该视图控制器设置为AnotherStoryboard的初始视图控制器，当程序加载该Storyboard时，将自
动加载当前的视图控制器，如图19.10所示。  
![](snapshot\1901_1910.jpg)
图19.10
对于一个基于【Single View Application】模板创建的项目来说，项目默认加载的Storyboard是Main.storyboard。通过项目通用信息配置页面，你可以更改项目的Main Interface，如图19.11所示。   
![](snapshot\1901_1911.jpg)
图19.11
在【Deployment Info】设置区域的【Main Interface】输入框内，默认为Main.storyboard，点击输入框右侧的下拉箭头，显示项目中的Storyboard列表。   
![](snapshot\1901_1912.jpg)
图19.12
在弹出的Storyboard列表中，选择【AnotherStoryboard.storyboard】选项，更改项目的Main Interface。然后点击Xcode界面左上角的【编译并运行】按钮，打开模拟器预览项目。项目运行后，将弹出一个绿色背影的模拟器，如图19.12所示。     
## 19.2  在Storyboard中使用标准控件 400                       
### 19.2.1  添加三个控件 400                                   
### 19.2.2  对控件进行连接 402                                 
## 19.3  在Storyboard中使用表格控件 405                       
### 19.3.1  在故事板中添加Table View 405                       
### 19.3.2  添加Table View Cell 405                            
### 19.3.3  设置Table View的数据源 407                         
### 19.3.4  修改ViewController.swift文件 408                   
## 19.4  在Storyboard中使用集合控件 409                       
### 19.4.1  添加Collection View 409                            
### 19.4.2  设置Collection View Cell 409                       
### 19.4.3  设置Collection View的数据源和代理 411              
### 19.4.4  修改ViewController.swift文件 412                   
## 19.5  Storyboard常见的层次结构 413                         
## 19.6  Storyboard之间的页面跳转和参数传递 417               
### 19.6.1  单个Storyboard中页面间的参数传递 417               
### 19.6.2  多个Storyboard中的页面跳转及参数传递 420           
## 19.7  使用约束功能适配多分辨率 424                         
### 19.7.1  打开并运行示例项目 424                             
### 19.7.2  给父视图MainView添加约束 426                       
### 19.7.3  给三个分隔线添加约束 428                           
### 19.7.4  给两个小箭头添加约束 429                           
### 19.7.5  给添加新会员按钮添加约束 431                       
### 19.7.6  给无数据图标添加约束 432                           
## 19.8  小结 433                                             