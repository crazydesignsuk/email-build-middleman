configure :development do
  activate :livereload do |livereload|
    livereload.host = Socket.ip_address_list.detect{|intf| intf.ipv4_private?}.ip_address
  end
end

set :css_dir, 'stylesheets'
set :images_dir, 'images'
set :partials_dir, 'partials'
activate :autoprefixer

::Compass.configuration.sass_options = { :line_comments => false, :style => :expanded }

Sass::Script::Number.precision = 6

# sets InlineCSS as an extension
# code from Tomaž Zaman http://goo.gl/6IAJRJ

require 'premailer'
class InlineCSS < Middleman::Extension  
  def initialize(app, options_hash={}, &block)
    super
    app.after_build do |builder|
      Dir.glob(build_dir + File::SEPARATOR + '*.html').each do |source_file|
        premailer = Premailer.new(source_file, verbose: true)
        destination_file = source_file.gsub('.html', '-inline.html')

        puts "Inlining file: #{source_file} to #{destination_file}"

        File.open(destination_file, "w") do |content|
          content.puts premailer.to_inline_css
        end
      end
    end
  end
end  
::Middleman::Extensions.register(:inline_css, InlineCSS)


configure :build do
  activate :inline_css
end