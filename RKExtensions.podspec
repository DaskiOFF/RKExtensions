Pod::Spec.new do |spec|
  spec.name         = "RKExtensions"
  spec.version      = "0.0.1"
  spec.summary      = "RKExtensions"

  spec.description  = "RKExtensions."
  spec.homepage     = "https://github.com/DaskiOFF/RKExtensions"
  spec.author       = { "Roman Kotov" => "waydeveloper@gmail.com" }
  spec.platform     = :ios, "9.0"
  spec.swift_versions = "5.2"

  spec.source       = { :git => "https://github.com/DaskiOFF/RKExtensions.git", :tag => "#{spec.version}" }

  spec.source_files  = "Sources", "RKExtensions/**/*.{swift}"

end
