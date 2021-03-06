cask 'adobe-reader-de' do
  version '11.0.00'
  sha256 'fba620a52ab0073c53dca18dc29edeebfe3e534325b97bbcd2a318f3747b6a98'

  url "http://ardownload.adobe.com/pub/adobe/reader/mac/#{version.to_i}.x/#{version}/de_DE/AdbeRdr#{version.gsub('.', '')}_de_DE.dmg"
  homepage 'https://www.adobe.com/de/products/reader.html'
  license :unknown

  pkg 'Adobe Reader XI Installer.pkg'
  uninstall :pkgutil => "com.adobe.acrobat.reader.#{version.gsub('.', '')}.*",
            :delete => '/Applications/Adobe Reader.app'
  zap       :delete => [
                        "~/Library/Application Support/Adobe/Acrobat/#{version.sub(%r{(\d+)\.(\d+).*},'\1.\2')}",
                        '~/Library/Preferences/com.adobe.Reader.plist',
                       ]
end
