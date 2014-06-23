Gem::Specification.new do |s|
  s.name        = 'Bank OCR Kata'
  s.version     = '0.1.0'
  s.required_ruby_version = '>= 2.0'
  s.licenses    = ['MIT']
  s.summary     = 'Implementation of the Bank OCR Kata'
  s.description = %q{
    This is a gemified version of the Bank OCR Kata. Making it a gem gives a
    cheap and easy way to check for a minimum Ruby version for use in the
    `bin/convert_ocr` script.
  }
  s.authors     = ['Stephen Caudill']
  s.email       = 'scaudill@gmail.com'
  s.files       = Dir.glob("lib/**/*.rb") + Dir.glob('bin/*') + %w(README.md)
  s.homepage    = 'http://www.codingdojo.org/cgi-bin/index.pl?KataBankOCR'
end
