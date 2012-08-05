require 'test/unit'

require 'fileutils'
require 'rexml/document'

class BasicTests < Test::Unit::TestCase

  def setup
    Helper.setup_test_directory
  end

  def teardown
    Helper.teardown_test_directory
  end

  def test_output_to_reports_dir
    Helper.pipe_xcodebuild_to_ocunit2junit

    assert File.directory?(Helper.test_reports_output_path),
           "Test reports should be written to a 'test-reports' directory"

    assert File.exists?(Helper.test_reports_output_path + '/TEST-TestProjectTests.xml'),
           "The TestProject should be parsed in a TEST-TestProjectTests.xml report"
  end

  def test_report_content
    Helper.pipe_xcodebuild_to_ocunit2junit
    file = File.new Helper.test_reports_output_path + '/TEST-TestProjectTests.xml'
    report = REXML::Document.new file

    assert !report.elements.empty?,
           "The TEST-TestProjectTests.xml test report shouldn't be empty"

    assert report.root.elements.size,
           "The TEST-TestProjectTests.xml report should have two <testcase/> elements"

    assert report.root.elements['//failure'],
           "The TEST-TestProjectTests.xml report should have one <failure/> element"
  end

  module Helper

    TEST_PATH = '/tmp/com.github.ocunit2junit.test'

    def self.setup_test_directory
      FileUtils.mkpath TEST_PATH
    end

    def self.teardown_test_directory
      FileUtils.rm_rf TEST_PATH
    end

    def self.test_reports_output_path
      TEST_PATH + '/test-reports'
    end

    def self.pipe_xcodebuild_to_ocunit2junit
      abs_file_path = File.expand_path(File.dirname(__FILE__))
      ocunit2junit = abs_file_path + '/../ocunit2junit.rb'
      xcodeproj = abs_file_path + '/TestProject/TestProject.xcodeproj'
      `pushd #{TEST_PATH}; xcodebuild -project #{xcodeproj} -scheme TestProject test | #{ocunit2junit}; popd`
    end

  end

end
