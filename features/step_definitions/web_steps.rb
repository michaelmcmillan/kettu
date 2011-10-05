# IMPORTANT: This file is generated by cucumber-rails - edit at your own peril.
# It is recommended to regenerate this file in the future when you upgrade to a 
# newer version of cucumber-rails. Consider adding your own code to a new file 
# instead of editing this one. Cucumber will automatically load all features/**/*.rb
# files.


require 'uri'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(locator) { yield } : yield
  end
end
World(WithinHelpers)

Given /^(?:|I )am on (.+)$/ do |page_name|
  patiently do
    visit path_to(page_name)
  end
end

When /^(?:|I )go to ([^\"]+)$/ do |page_name|
  patiently do
    visit path_to(page_name)
  end
end

When /^(?:|I )press "([^\"]*)"(?: within "([^\"]*)")?$/ do |button, selector|
  patiently do
    with_scope(selector) do
      begin
        click_button(button)
      rescue
        locate("//button[@title='#{button}']").click
      end
    end
  end
end

When /^(?:|I )follow "([^\"]*)"(?: within "([^\"]*)")?$/ do |link, selector|
  patiently do
    with_scope(selector) do
      click_link(link)
    end
  end
end

When /^(?:|I )fill in "([^\"]*)" with "([^\"]*)"(?: within "([^\"]*)")?$/ do |field, value, selector|
  patiently do
    with_scope(selector) do
      fill_in(field, :with => value)
    end
  end
end

When /^(?:|I )fill in "([^\"]*)" for "([^\"]*)"(?: within "([^\"]*)")?$/ do |value, field, selector|
  patiently do
    with_scope(selector) do
      fill_in(field, :with => value)
    end
  end
end

# Use this to fill in an entire form with data from a table. Example:
#
#   When I fill in the following:
#     | Account Number | 5002       |
#     | Expiry date    | 2009-11-01 |
#     | Note           | Nice guy   |
#     | Wants Email?   |            |
#
# TODO: Add support for checkbox, select og option
# based on naming conventions.
#
When /^(?:|I )fill in the following(?: within "([^\"]*)")?:$/ do |selector, fields|
  patiently do
    with_scope(selector) do
      fields.rows_hash.each do |name, value|
        When %{I fill in "#{name}" with "#{value}"}
      end
    end
  end
end

When /^(?:|I )select "([^\"]*)" from "([^\"]*)"(?: within "([^\"]*)")?$/ do |value, field, selector|
  patiently do
    with_scope(selector) do
      select(value, :from => field)
    end
  end
end

When /^(?:|I )check "([^\"]*)"(?: within "([^\"]*)")?$/ do |field, selector|
  patiently do
    with_scope(selector) do
      check(field)
    end
  end
end

When /^(?:|I )uncheck "([^\"]*)"(?: within "([^\"]*)")?$/ do |field, selector|
  patiently do
    with_scope(selector) do
      uncheck(field)
    end
  end
end

When /^(?:|I )choose "([^\"]*)"(?: within "([^\"]*)")?$/ do |field, selector|
  patiently do
    with_scope(selector) do
      choose(field)
    end
  end
end

When /^(?:|I )attach the file "([^\"]*)" to "([^\"]*)"(?: within "([^\"]*)")?$/ do |path, field, selector|
  patiently do
    with_scope(selector) do
      attach_file(field, path)
    end
  end
end

Then /^(?:|I )should see "([^\"]*)"(?: within "([^\"]*)")?$/ do |text, selector|
  patiently do
    with_scope(selector) do
      page.should have_content(text)
    end
  end
end

Then /^(?:|I )should see \/([^\/]*)\/(?: within "([^\"]*)")?$/ do |regexp, selector|
  regexp = Regexp.new(regexp)
  patiently do
    with_scope(selector) do
      page.should have_xpath('//*', :text => regexp)
    end
  end
end

Then /^(?:|I )should not see "([^\"]*)"(?: within "([^\"]*)")?$/ do |text, selector|
  patiently do
    with_scope(selector) do
      page.should have_no_content(text)
    end
  end
end

Then /^(?:|I )should not see \/([^\/]*)\/(?: within "([^\"]*)")?$/ do |regexp, selector|
  regexp = Regexp.new(regexp)
  patiently do
    with_scope(selector) do
      page.should have_no_xpath('//*', :text => regexp)
    end
  end
end

Then /^the "([^\"]*)" field(?: within "([^\"]*)")? should contain "([^\"]*)"$/ do |field, selector, value|
  patiently do
    with_scope(selector) do
      field_labeled(field).value.should match(/#{value}/)
    end
  end
end

Then /^the "([^\"]*)" field(?: within "([^\"]*)")? should not contain "([^\"]*)"$/ do |field, selector, value|
  patiently do
    with_scope(selector) do
      find_field(field).value.should_not match(/#{value}/)
    end
  end
end

Then /^the "([^\"]*)" checkbox(?: within "([^\"]*)")? should be checked$/ do |label, selector|
  patiently do
    with_scope(selector) do
      field_labeled(label)['checked'].should == 'checked'
    end
  end
end

Then /^the "([^\"]*)" checkbox(?: within "([^\"]*)")? should not be checked$/ do |label, selector|
  patiently do
    with_scope(selector) do
      field_labeled(label)['checked'].should_not == 'checked'
    end
  end
end
 
Then /^(?:|I )should have the following query string:$/ do |expected_pairs|
  actual_params   = CGI.parse(URI.parse(current_url).query)
  expected_params = Hash[expected_pairs.rows_hash.map{|k,v| [k,[v]]}]
 
  patiently do
    actual_params.should == expected_params
  end
end

Then /^show me the page$/ do
  save_and_open_page
end

Then /I should see a torrent "([^\"]*)"/ do |title|
  find("#torrents li:contains('#{title}')").visible?
end

Then /I should not see a torrent "([^\"]*)"/ do |title|
  !find("#torrents li:contains('#{title}')").visible?
end
