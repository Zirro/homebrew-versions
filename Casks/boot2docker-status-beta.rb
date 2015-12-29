cask 'boot2docker-status-beta' do
  version '1.1.0.beta2'
  sha256 'ce16ce45def874edacc719ff5ef6b79655011adbb3284da13bc3fef7e09dbcd2'

  # github.com is the official download host per the vendor homepage
  url "https://github.com/nickgartmann/boot2docker-status/releases/download/#{version}/Boot2Docker.Status-v#{version}.beta2.zip"
  appcast 'https://github.com/nickgartmann/boot2docker-status/releases.atom',
          :sha256 => 'e399bad2bf54114275f4dbce07312b54338baca54d8489326405130501a02a0e'
  name 'Boot2Docker Status'
  homepage 'http://boot2docker-status.nickgartmann.com'
  license :apache

  app 'Boot2Docker Status.app'

  uninstall :quit => 'RokkinCat.Boot2Docker-Status'
end
