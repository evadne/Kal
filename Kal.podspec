Pod::Spec.new do |s|
  s.name         = "Kal"
  s.version      = "0.0.1"
  s.summary      = "A calendar component for the iPhone (the UI is designed to match MobileCal)."
  s.homepage     = "http://github.com/evadne/Kal"
  s.author       = { "Keith Lazuka" => "" }
  s.source       = { :git => "git://github.com/evadne/Kal.git" }
  s.platform     = :ios, '6.0'
  s.source_files = 'src', 'src/**/*.{h,m}'
  
  def s.post_install (target_installer)
    if Version.new(Pod::VERSION) >= Version.new('0.16.999')
      script_path = target_installer.copy_resources_script_path
    else
      script_path = File.join(config.project_pods_root, target_installer.target_definition.copy_resources_script_name)
    end
    File.open(script_path, 'a') do |file|
      file.puts "install_resource 'src/Kal.bundle'"
    end
  end
end
