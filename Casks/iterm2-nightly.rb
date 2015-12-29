cask 'iterm2-nightly' do
  version '2_9_20151213'
  sha256 '2d071af597ee2535cd2a32088532054ecc6ee75d8f3cf2036213b9a8cf0c3e4e'

  url "https://www.iterm2.com/downloads/nightly/iTerm2-#{version}-nightly.zip"
  appcast 'https://iterm2.com/appcasts/nightly.xml',
          :sha256 => '74e804add307c0eba9dd52a3cfa8eda633cfbfe839f09956ff06306c9b1fcadc'
  name 'iTerm2'
  name 'iTerm 2'
  homepage 'https://www.iterm2.com/'
  license :gpl

  app 'iTerm.app'
  
  zap :delete => '~/Library/Preferences/com.googlecode.iterm2.plist'
end
