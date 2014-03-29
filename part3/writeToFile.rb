#!/usr/bin/ruby
#!/usr/bin/env ruby

require 'fileutils'

FileUtils.mv('/logs/logger.pid', '/logsCopy/loggerCopy.pid')