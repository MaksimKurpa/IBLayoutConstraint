
Pod::Spec.new do |s|
  s.name             = 'IBLayoutConstraint'
  s.version          = '1.0.0'
  s.summary          = 'Specify constraints for each device separately. Forget about device detection and configuring constraints in code. Do it in Interface Builder with IBLayoutConstraint.'
  s.ios.deployment_target = '11.0'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Maks Kurpa' => 'maksim.kurpa@gmail.com' }
  s.description      = 'Forget about device detection and configuring constraints in code. Do it in Interface Builder with IBLayoutConstraint.'
  s.homepage         = 'https://github.com/MaksimKurpa/IBLayoutConstraint'
  s.source       = { :git => 'https://github.com/MaksimKurpa/IBLayoutConstraint.git', :branch => 'master',:tag => s.version.to_s }
  s.social_media_url = 'https://www.facebook.com/maksim.kurpa'
  s.source_files = 'Sources/*.{swift}'
  s.requires_arc = true
end
