Gem::Specification.new do |s|
    s.name        = 'ocunit2junit'
    s.executables << 'ocunit2junit'
    s.version     = '1.1'
    s.date        = '2012-10-02'
    s.summary     = "A script that converts OCUnit output to JUnit style XML output."
    s.description = "Simply pipe your xcodebuild output through ocunit2junit: xcodebuild ... | ocunit2junit.rb"
    s.authors     = ["Christian Hedin"]
    s.files       = ["bin/ocunit2junit"]
      s.homepage    =
              'https://github.com/ciryon/OCUnit2JUnit'
end