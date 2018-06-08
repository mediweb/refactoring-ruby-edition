guard :rspec, cmd: "bundle exec rspec" do
  watch(%r{^lib/(.+)\.rb$}) { |m| "spec" }
  watch(%r{^spec/(.+)\.rb$}) { |m| "spec" }
end
