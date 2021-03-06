Pod::Spec.new do |s|
  s.name = 'Spotify-iOS-SDK'
  s.module_name = 'Spotify'
  s.summary = 'The new Spotify iOS SDK.'
  s.version = '0.17.0'
  s.source = { :http => 'https://github.com/spotify/ios-sdk/releases/download/beta-17/ios-sdk-deploy-beta-17.zip' }

  s.license = { :type => 'Proprietary', :text => 'https://developer.spotify.com/developer-terms-of-use/' }
  s.author = { 'Spotify' => 'https://developer.spotify.com/' }
  s.homepage = 'https://developer.spotify.com/technologies/spotify-ios-sdk/'

  s.platform = :ios
  s.ios.deployment_target = '7.1'

  s.requires_arc = true
  s.framework = 'Foundation', 'AVFoundation'

  s.pod_target_xcconfig = {
    'OTHER_LDFLAGS' => '$(inherited) -ObjC'
  }

  s.user_target_xcconfig = {
    'LIBRARY_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/Spotify-iOS-SDK"',
    'OTHER_LDFLAGS' => '-l"Spotify"'
  }

  s.preserve_paths = 'Spotify.framework/Spotify'
  s.prepare_command = 'touch Empty.m && cp Spotify.framework/Spotify libSpotify.a && cp Spotify.framework/Headers/* .'

  s.source_files = 'Empty.m', '*.h'
  s.public_header_files = '*.h'

  s.vendored_libraries = 'libSpotify.a'
end
