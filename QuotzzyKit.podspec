Pod::Spec.new do |spec|
    spec.name = "QuotzzyKit"
    spec.version = "1.1.3"
    spec.summary = "An elegant client for Quotzzy API written in Swift."
    spec.homepage = "https://github.com/AnatoliyGatt/QuotzzyKit"
    spec.license = { :type => "MIT", :file => "LICENSE" }
    spec.author = { "Anatoliy Gatt" => "anatoliy.gatt@aol.com" }
    spec.ios.deployment_target = "8.0"
    spec.watchos.deployment_target = "2.0"
    spec.source = { :git => "https://github.com/AnatoliyGatt/QuotzzyKit.git", :tag => "v#{spec.version}"}
    spec.source_files = "QuotzzyKit/*.swift"
    spec.requires_arc = true
    spec.cocoapods_version = ">= 0.39"
end
