Pod::Spec.new do |s|
  s.name         = "ChaihuLeftDrawer"
  s.version      = "0.0.1"
  s.summary      = "左抽屉"

  s.description  = <<-DESC
                    左抽屉
                   DESC

  s.homepage     = "https://github.com/chaiHuJYK/ChaihuLeftDrawer"

  s.license      = "MIT (example)"
  s.author       = { "shanli" => "shanli@2dfire.com" }
  s.source       = { :git => "https://github.com/chaiHuJYK/ChaihuLeftDrawer.git", :tag => "#{s.version}" }

  s.source_files  = "ChaihuLeftDrawer/Class/**/*.{h,m}"
  s.resources = "ChaihuLeftDrawer/Classes/**/*.{xib,xml,xcassets}"

end
