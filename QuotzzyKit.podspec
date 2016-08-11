Pod::Spec.new do |spec|
    spec.name = "QuotzzyKit"
    spec.version = "2.0.1"
    spec.summary = "An elegant client for Quotzzy API written in Swift."
    spec.homepage = "https://github.com/AnatoliyGatt/QuotzzyKit"
    spec.license = { :type => "MIT", :file => "LICENSE" }
    spec.author = { "Anatoliy Gatt" => "anatoliy.gatt@aol.com" }
    spec.osx.deployment_target = "10.10"
    spec.ios.deployment_target = "8.0"
    spec.watchos.deployment_target = "2.0"
   	spec.tvos.deployment_target = "9.0"
    spec.source = { :git => "https://github.com/AnatoliyGatt/QuotzzyKit.git", :tag => "v#{spec.version}"}
    spec.source_files = "Sources/*.swift"
    spec.requires_arc = true
    spec.cocoapods_version = ">= 0.39"
end
