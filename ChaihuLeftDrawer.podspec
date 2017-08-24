Pod::Spec.new do |s|
  s.name         = "ChaihuLeftDrawer"
  s.version      = "0.0.1"
  s.summary      = "简单抽屉效果"

  s.description  = <<-DESC
                    简单抽屉效果。
                   DESC

  s.homepage     = "https://github.com/chaiHuJYK/ChaihuLeftDrawer"

  #s.license      = "MIT (example)"
  s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "shanli" => "shanli@2dfire.com" }
  s.source       = { :git => "https://github.com/chaiHuJYK/ChaihuLeftDrawer.git", :tag => "#{s.version}" }
  s.ios.deployment_target = '8.0'

  s.source_files  = 'ChaihuLeftDrawer/Classes/**/*.{h,m}'
  #s.exclude_files = "Classes/Exclude"
  #资源文件
  s.resources = "ChaihuLeftDrawer/Classes/**/*.{xib,xml,xcassets}"
end
