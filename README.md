Introduction
======================

OCUnit2JUnit is a script that converts output from OCUnit to the format used by JUnit. The main purpose is to be able to parse output from Objective-C (OCUnit) test cases on a Java-based build server, such as [Jenkins](http://jenkins-ci.org/).

Usage
======================

* Install with 'gem install ocunit2junit' (possibly prepended by 'sudo' if your Ruby installation requires that)
* Put the script somewhere where your build server can read it
* Use this shell command to build: 

	`xcodebuild -t <target> -sdk <sdk> -configuration <config> 2>&1 | /path/to/ocunit2junit.rb`

* The output is, by default, in the `test-reports` folder
* If your build fails, this script will pass the error code
* All output is also passed along, so you will still see everything in your build log


More information
======================

Can be found in [this blog post](http://blog.jayway.com/2010/01/31/continuos-integration-for-xcode-projects/).


Licence
======================

Free to use however you want.
