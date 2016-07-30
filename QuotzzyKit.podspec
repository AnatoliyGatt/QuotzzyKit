Pod::Spec.new do |spec|
	spec.name = "QuotzzyKit"
	spec.version = "1.0.1"
	spec.summary = "An elegant client for Quotzzy API written in Swift."
	spec.homepage = "https://github.com/AnatoliyGatt/QuotzzyKit"
	spec.license = { :type => "MIT", :file => "LICENSE" }
	spec.author = { "Anatoliy Gatt" => "anatoliy.gatt@aol.com" }
	spec.platform = :ios, "8.0"
	spec.source = { :git => "https://github.com/AnatoliyGatt/QuotzzyKit.git", :tag => "v#{spec.version}"}
	spec.source_files = "QuotzzyKit/*.swift"
	spec.requires_arc = true
	spec.cocoapods_version = ">= 0.36"
end
