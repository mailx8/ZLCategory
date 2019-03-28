

Pod::Spec.new do |spec|

## ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― ##

## 名称
spec.name         = "ZLCategory"
## 版本号
spec.version      = "1.0.1"
## 注释
spec.summary      = "A short description of ZLCategory."

## 详细注释
spec.description  = <<-DESC
1.0.1：新增融错的分类
1）处理数组越界
2）处理可变数组增加空元素/空数组/设值/取值的融错
3）处理字典的设值的融错
4）处理空串

DESC

## 主页地址
spec.homepage     = "https://github.com/ZLFighting/ZLCategory"
## 授权方式和文件地址
spec.license      = "MIT (example)"
spec.license      = { :type => "MIT", :file => "LICENSE.md" }
##  邮箱
spec.author             = { "zhangli" => "3206946374@qq.com" }
spec.platform     = :ios, "9.0"
spec.ios.deployment_target = "9.0"

spec.requires_arc = true

spec.frameworks = 'UIKit', 'Foundation'

## 文件路径
spec.source       = { :git => "https://github.com/ZLFighting/ZLCategory.git", :tag => "#{spec.version}" }

spec.static_framework = true

spec.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }

## 支持文件路径
spec.source_files  =  "Code/**/*.{h,m}"

##spec.resources = ['Code/**/*.{png}']

## 依赖
##spec.dependency 'ZL','1.0.0'

end
